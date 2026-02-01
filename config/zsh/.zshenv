setopt allexport
for FILE in $(ls "${XDG_CONFIG_HOME:-$HOME/.config}/environment.d"); do
	source "${XDG_CONFIG_HOME:-$HOME/.config}/environment.d/$FILE"
done
unsetopt allexport
unset FILE

export LESSHISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/lesshst"
export SHELL_SESSION_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/sessions"
export SHELL_SESSION_FILE="$SHELL_SESSION_DIR/$TERM_SESSION_ID"
