type mise >/dev/null 2>&1 && {
	export MISE_CONFIG_DIR="$XDG_CONFIG_HOME/mise"
	eval "$(mise activate)"
}
