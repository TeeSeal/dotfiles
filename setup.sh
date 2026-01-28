#!/usr/bin/env sh
link_file() {
	if [ -e "$2" ]; then
		if [ "$1" -ef "$2" ]; then
			echo "OK:  $1 already linked"
			return 0
		else
			mv "$2" "$2.bak"
			echo "WARN:  moved $2 to $2.bak"
		fi
	fi

	ln -sf "$1" "$2"
	echo "OK:  linked $1 to $2"
}

prompt_yes_no() {
	printf "%s [Y/n]: " "$1"
	read answer
	case $answer in
		[Nn]* ) return 1;;
		* ) return 0;
	esac
}

DOTFILES=$(cd "$(dirname "$0")"; pwd)
HOME_SRC="$DOTFILES/home"
CONFIGS_SRC="$DOTFILES/config"

for SRC in $(find $HOME_SRC -maxdepth 1 -mindepth 1); do
	FILE_PATH="$HOME/$(basename $SRC)"

	if prompt_yes_no "Link $FILE_PATH?"; then
		link_file $SRC $FILE_PATH
	fi
done

for SRC in $(find $CONFIGS_SRC -maxdepth 2 -mindepth 2); do
	FILE_PATH="${XDG_CONFIG_HOME:-$HOME/.config}${SRC#$CONFIGS_SRC}"
	if prompt_yes_no "Link $FILE_PATH?"; then
		mkdir -p $(dirname $FILE_PATH)
		link_file $SRC $FILE_PATH
	fi
done

for SRC in $(find $CONFIGS_SRC -maxdepth 1 -mindepth 1 -type f); do
	FILE_PATH="${XDG_CONFIG_HOME:-$HOME/.config}${SRC#$CONFIGS_SRC}"
	if prompt_yes_no "Link $FILE_PATH?"; then
		mkdir -p $(dirname $FILE_PATH)
		link_file $SRC $FILE_PATH
	fi
done

echo; echo "✨  Done"
