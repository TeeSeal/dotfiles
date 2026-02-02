fish_add_path "$HOME/.local/bin"

set --query XDG_CONFIG_HOME; or set --global --export XDG_CONFIG_HOME "$HOME/.config"
set --query XDG_CACHE_HOME; or set --global --export XDG_CACHE_HOME "$HOME/.cache"
set --query XDG_DATA_HOME; or set --global --export XDG_DATA_HOME "$HOME/.local/share"
set --query XDG_STATE_HOME; or set --global --export XDG_STATE_HOME "$HOME/.local/state"

for file in $XDG_CONFIG_HOME/environment.d/*
    cat $file | string replace -- = ' ' | string replace -r '^(.)' 'set --global --export $1' | source
end

set --global --export LANG "en_US.UTF-8"
set --global --export LC_ALL "en_US.UTF-8"

set --global --export EDITOR "nvim"
set --global --export VISUAL "zed --wait"

set --global --export LESSHISTFILE "$XDG_STATE_HOME/lesshst"
