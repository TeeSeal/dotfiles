path+=($HOME/.local/bin)

setopt allexport
for FILE in $(ls "${XDG_CONFIG_HOME:-$HOME/.config}/environment.d"); do
	source "${XDG_CONFIG_HOME:-$HOME/.config}/environment.d/$FILE"
done
unsetopt allexport
unset FILE

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
