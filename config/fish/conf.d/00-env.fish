fish_add_path "$HOME/.local/bin"

set --query XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME "$HOME/.config"
set --query XDG_CACHE_HOME; or set -gx XDG_CACHE_HOME "$HOME/.cache"
set --query XDG_DATA_HOME; or set -gx XDG_DATA_HOME "$HOME/.local/share"
set --query XDG_STATE_HOME; or set -gx XDG_STATE_HOME "$HOME/.local/state"

for file in $XDG_CONFIG_HOME/environment.d/*
    cat $file | string replace -- = ' ' | string replace -r '^(.)' 'set -gx $1' | source
end

set -gx LANG "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

set -gx EDITOR "nvim"
set -gx VISUAL "zed --wait"

set -gx LESSHISTFILE "$XDG_STATE_HOME/lesshst"

set -gx MISE_FISH_AUTO_ACTIVATE "0"
