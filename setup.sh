#!/usr/bin/env sh

type brew >/dev/null 2>&1 || {
	echo "🍺  Installing Homebrew..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

type sheldon >/dev/null 2>&1 || {
	echo "📦  Installing sheldon..."
	brew install sheldon
}

type mise >/dev/null 2>&1 || {
	echo "🪛  Installing mise..."
	brew install mise
}

type fzf >/dev/null 2>&1 || {
	echo "🔎  Installing fzf..."
	brew install fzf
}

type starship >/dev/null 2>&1 || {
	echo "🚀  Installing starship..."
	brew install mise
}

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

DOTFILES=$(cd "$(dirname "$0")"; pwd)
HOME_SRC="$DOTFILES/home"
CONFIGS_SRC="$DOTFILES/config"

for SRC in $(find $HOME_SRC -depth 1); do
	FILE_PATH="$HOME/$(basename $SRC)"
	link_file $SRC $FILE_PATH
done

for SRC in $(find $CONFIGS_SRC -depth 2); do
	FILE_PATH="${XDG_CONFIG_HOME:-$HOME/.config}${SRC#$CONFIGS_SRC}"
	mkdir -p $(dirname $FILE_PATH)
	link_file $SRC $FILE_PATH
done

for SRC in $(find $CONFIGS_SRC -depth 1 -type f); do
	FILE_PATH="${XDG_CONFIG_HOME:-$HOME/.config}${SRC#$CONFIGS_SRC}"
	mkdir -p $(dirname $FILE_PATH)
	link_file $SRC $FILE_PATH
done

echo; echo "✨  Done"
