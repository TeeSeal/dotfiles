export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export DOTFILES="$HOME/.dotfiles"

export LESSHISTFILE="$XDG_STATE_HOME/lesshst"

export CLICOLOR=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"

export LANG="en_GB.UTF-8"
export LC_ALL="en_US.UTF-8"

export EDITOR="nvim"
export VISUAL="code"

export SHELL_SESSION_DIR="$XDG_STATE_HOME/zsh/sessions"
export SHELL_SESSION_FILE="$SHELL_SESSION_DIR/$TERM_SESSION_ID"

export GPG_TTY=$(tty)

export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdf/asdfrc"

# Source local zprofile
[ -f "$XDG_CONFIG_HOME/zsh/.zprofile.local" ] && source "$XDG_CONFIG_HOME/zsh/.zprofile.local"
