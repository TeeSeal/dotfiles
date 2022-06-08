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

local home="$DOTFILES/symlinks/home"
for src in $(find $home -type f); do
  local file_path="$HOME/$(basename $src)"
  link_file $src $file_path
done

local configs="$DOTFILES/symlinks/config"
for src in $(find $configs -type f); do
  local file_path="${XDG_CONFIG_HOME:-$HOME/.config}${src#$configs}"
  mkdir -p $(dirname $file_path)
  link_file $src $file_path
done

# mkdir -p "$HOME/.dotfiles"
# link_file "$DOTFILES/plugins" "$HOME/.dotfiles/public-plugins"
