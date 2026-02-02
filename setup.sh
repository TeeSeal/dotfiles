#!/usr/bin/env sh

install_file() {
	printf "Install %s? [S]kip/[l]ink/[c]opy: " "$2"
	read answer
	case $answer in
		"l" | "link" | "c" | "copy");;
		*) return 1;;
	esac

	case $answer in
		"l" | "link")
			if [ -e "$2" ]; then
				if [ "$1" -ef "$2" ]; then
					echo "	OK: $2 already linked"
					return 0
				else
					mv "$2" "$2.bak"
					echo "	WARN: moved $2 to $2.bak"
				fi
			fi

			mkdir -p $(dirname $FILE_PATH)
			ln -sf "$1" "$2"
			echo "	OK: linked $1 to $2";;
		"c" | "copy")
			if [ -e "$2" ]; then
				if cmp -s "$1" "$2"; then
					echo "	OK: $2 already exists with the same contents"
					return 0
				else
					mv "$2" "$2.bak"
					echo "	WARN: moved $2 to $2.bak"
				fi
			fi

			cp -f "$1" "$2"
			echo "	OK: copied $1 to $2";;
	esac

	return 0
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
CONFIGS_SRC="$DOTFILES/config"

for SRC in $(find $CONFIGS_SRC -maxdepth 2 -mindepth 2); do
	FILE_PATH="${XDG_CONFIG_HOME:-$HOME/.config}${SRC#$CONFIGS_SRC}"
	install_file $SRC $FILE_PATH
done

for SRC in $(find $CONFIGS_SRC -maxdepth 1 -mindepth 1 -type f); do
	FILE_PATH="${XDG_CONFIG_HOME:-$HOME/.config}${SRC#$CONFIGS_SRC}"
	install_file $SRC $FILE_PATH
done

echo; echo "✨  Done"
