RBENV_HOME="$HOME/.rbenv"
[[ :$PATH: == *":$RBENV_HOME/bin:"* ]] || PATH+=":$RBENV_HOME/bin"
[[ :$PATH: == *":$RBENV_HOME/shims:"* ]] || eval "$(rbenv init -)"
