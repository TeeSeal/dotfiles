#!/usr/bin/env sh

printf "Install NVim? [y/n]: "
if ! yn; then
  echo; return
fi
echo

which nvim >/dev/null 2>&1 || brew install nvim

NVIM_PATH="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

[ -e "$NVIM_PATH" ] || mkdir -p "$NVIM_PATH"

for SOURCE in $(find "$DOTFILES/nvim" -depth 1); do
  TARGET="$NVIM_PATH/$(basename $SOURCE)"
  ln -sf $SOURCE $TARGET
done

echo "✅  linked config file"
