alias gbdar="git branch --merged master | grep -v master | cut -d/ -f2- | xargs -n 1 git push --delete origin"
alias gitclear="gcm && glum && gp; gbdar; gbda"
alias grhh~="git reset --hard HEAD~"
