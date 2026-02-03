if test -d /opt/homebrew
    /opt/homebrew/bin/brew shellenv | source
end

mise activate fish | source

if status is-interactive
    starship init fish | source
    fish_vi_key_bindings
end
