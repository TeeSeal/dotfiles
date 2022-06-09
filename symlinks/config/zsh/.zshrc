[ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Plugins
export ZI_HOME="$HOME/.zi"
source "$ZI_HOME/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

zi wait lucid light-mode for \
  multisrc="*" "$DOTFILES/public-plugins" \
  OMZ::lib/git.zsh \
  OMZP::git \
  atload="_zsh_autosuggest_start" zsh-users/zsh-autosuggestions \
  iridakos/goto \
  atload="zicompinit; zicdreplay" zsh-users/zsh-completions

zi light-mode for \
  pick="async.zsh" src="pure.zsh" sindresorhus/pure \
  z-shell/F-Sy-H

# History
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE

# asdf
[ -f "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh" ] && . "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh"

# Source fzf if present
[ -f "$DOTFILES/fzf.zsh" ] && . "$DOTFILES/fzf.zsh"

# Source localrc
[ -f "$HOME/.localrc" ] && . "$HOME/.localrc"

# Source secretrc
[ -f "$HOME/.secretrc" ] && . "$HOME/.secretrc"

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
