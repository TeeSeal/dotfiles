# MacOS specific
if [[ "$OSTYPE" == "darwin"* ]]; then
	[ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
	# Remove git completions from brew in favor of the zsh ones
	rm -f "$HOMEBREW_PREFIX/share/zsh/site-functions/_git"
fi

# Plugins
eval "$(sheldon source)"
source <(fzf --zsh)


# History
mkdir -p "${XDG_STATE_HOME:-$HOME/.local/state}/zsh"
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE


# Completions
autoload -Uz compinit && compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories


# Misc
setopt MENU_COMPLETE # Automatically select first option
setopt AUTO_LIST     # Show list on first Tab press
setopt NO_LIST_BEEP  # Prevent beeps when showing list


# Ensure emcas mode
set -o emacs


# Make all PATH entires unique
typeset -aU path
