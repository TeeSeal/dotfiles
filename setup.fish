#!/usr/bin/env fish

function backup_file --argument-names file
    mv $file "$file.bak"
    echo "	WARN: moved $file to $file.bak"
end

function install_file --argument-names source destination
    read --prompt-str "Install $destination? [S]kip/[l]ink/[c]opy: " choice; or exit

    switch $choice
    case "l" "link"
        if test -e $destination
            if test $source -ef $destination
                echo "	OK: $destination already linked."
                return 0
            else
                backup_file $destination
            end
        end

        mkdir --parents $(dirname $destination)
        ln --symbolic --force $source $destination
        echo "	OK: linked $source to $destination."
    case "c" "copy"
        if test -e $destination
            if cmp --silent $source $destination
                echo "	OK: $destination already exists with the same contents."
                return 0
            else
                backup_file $destination
            end
        end

        mkdir --parents $(dirname $destination)
        cp --force $source $destination
        echo "	OK: copied $source to $destination."
    case *
        return 1
    end

    return 0
end

set --local dotfiles_dir (cd (dirname (status --current-filename)); pwd)
set --query XDG_CONFIG_HOME; or set --local XDG_CONFIG_HOME "$HOME/.config"

for source in (find $dotfiles_dir/config -maxdepth 1 -mindepth 1 -type f) $dotfiles_dir/config/*/*
    set --local destination (string replace "$dotfiles_dir/config" $XDG_CONFIG_HOME $source)
    install_file $source $destination
end

functions --erase backup_file
functions --erase install_file

echo; echo "✨  Done"
