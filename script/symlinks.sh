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

for src in $(ls "$DOTFILES/symlinks"); do
  link_file "$DOTFILES/symlinks/$src" "$HOME/.$src"
done

mkdir -p "$HOME/.dotfiles"
link_file "$DOTFILES/plugins" "$HOME/.dotfiles/public-plugins"
