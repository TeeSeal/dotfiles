export ZSH="/Users/TeeSeal/.oh-my-zsh"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

POWERLEVEL9K_MODE="awesome-fontconfig"
ZSH_THEME="powerlevel9k/powerlevel9k"

DEFAULT_USER="teeseal"
EDITOR="vim"
VEDITOR="code"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Powerlevel9k config
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs rbenv time)
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'
FAST_HIGHLIGHT=()
