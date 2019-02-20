RBENV_HOME="$HOME/.rbenv"
[[ :$PATH: == *":$RBENV_HOME/bin:"* ]] || PATH+=":$RBENV_HOME/bin"
eval "$(rbenv init -)"
