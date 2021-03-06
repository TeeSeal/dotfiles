#!/usr/bin/env sh

printf "Install NVim? [y/n]: "
if ! yn; then
  echo; return
fi
echo

which nvim >/dev/null 2>&1 || brew install nvim

NVIM_PATH="$HOME/.config/nvim"
AUTOLOAD_PATH="$NVIM_PATH/autoload"

[ -e "$NVIM_PATH" ] || mkdir -p "$NVIM_PATH"
ln -sf "$DOTFILES/nvim/init.vim" "$NVIM_PATH/init.vim"

echo "✅  linked config file"

if ! [ -e "$AUTOLOAD_PATH/plug.vim" ]; then
  echo "Installing VimPlug"
  curl -fLo "$AUTOLOAD_PATH/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
