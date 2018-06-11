export ZSH=/Users/TeeSeal/.oh-my-zsh
export SSH_KEY_PATH="~/.ssh/rsa_id"
export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

POWERLEVEL9K_MODE="awesome-fontconfig"
ZSH_THEME="powerlevel9k/powerlevel9k"
DEFAULT_USER="TeeSeal"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Git
alias gbdar="git branch --merged master | grep -v master | cut -d/ -f2- | xargs -n 1 git push --delete origin"
alias gitclear="gcm && glum && gbdar && gbda && gp"
alias grhh~="git reset --hard HEAD~"

# Dir
alias cdc="cd ~/Code"
alias cdse="cd ~/Code/saltedge"
alias cdrobber="cd ~/Code/saltedge/repos/robber"
alias cdsalt="cd ~/Code/saltedge/repos/salt-common"
alias cdstealer="cd ~/Code/saltedge/repos/stealer"
alias cddrive="cd ~/Google\ Drive"

# Util
alias zshconfig="vim ~/.zshrc"
alias zshplugins="vim ~/.zsh_plugins"

# Init antibody
source <(antibody init)
antibody bundle < ~/.zsh_plugins

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

eval $(thefuck --alias)

eval "$(rbenv init -)"

