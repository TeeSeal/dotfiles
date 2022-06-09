[ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Plugins
source "$XDG_DATA_HOME/zinit/zinit.git/zinit.zsh"

zinit wait lucid light-mode for \
  OMZ::lib/git.zsh \
  OMZP::git \
  iridakos/goto \
  zsh-users/zsh-completions \
  atload="_zsh_autosuggest_start" zsh-users/zsh-autosuggestions \
  atinit="zicompinit; zicdreplay" zdharma-continuum/fast-syntax-highlighting

zinit light-mode for \
  multisrc="*" "$ZDOTDIR/plugins" \
  pick="async.zsh" src="pure.zsh" sindresorhus/pure

# History
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE

# Make all PATH entires unique
typeset -aU path

# Completions
fpath+=($HOMEBREW_PREFIX/share/zsh/site-functions)

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

setopt MENU_COMPLETE # Automatically select first option
setopt AUTO_LIST     # Show list on first Tab press
setopt NO_LIST_BEEP  # Prevent beeps when showing list

# Source local zshrc
[ -f "$XDG_CONFIG_HOME/zsh/.zshrc.local" ] && source "$XDG_CONFIG_HOME/zsh/.zshrc.local"
