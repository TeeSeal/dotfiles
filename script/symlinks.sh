#!/usr/bin/env sh

echo
echo "🔗  SYMLINKS"

link_file() {
  if [ -e "$2" ]; then
    if [ "$1" -ef "$2" ]; then
      echo "✅  $1 already linked"
      return 0
    else
      mv "$2" "$2.bak"
      echo "⚠️  moved $2 to $2.bak"
    fi
  fi

  ln -sf "$1" "$2"
  echo "✅  linked $1 to $2"
}

SYMLINKS_HOME="$DOTFILES/symlinks/home"
for SRC in $(find $SYMLINKS_HOME -type f); do
  FILE_PATH="$HOME/$(basename $SRC)"
  link_file $SRC $FILE_PATH
done

CONFIGS_HOME="$DOTFILES/symlinks/config"
for src in $(find $CONFIGS_HOME -type f); do
  FILE_PATH="${XDG_CONFIG_HOME:-$HOME/.config}${src#$CONFIGS_HOME}"
  mkdir -p $(dirname $FILE_PATH)
  link_file $src $FILE_PATH
done
