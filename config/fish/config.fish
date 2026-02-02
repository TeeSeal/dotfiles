if test -d /opt/homebrew
    /opt/homebrew/bin/brew shellenv | source
end

mise activate fish | source

if status is-interactive
    starship init fish | source
end
