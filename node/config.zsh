export N_PREFIX="$HOME/.n"
zplug "tj/n", hook-build:"PREFIX=$N_PREFIX make install",
[[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
