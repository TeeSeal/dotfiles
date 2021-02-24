#!/usr/bin/env sh

printf "Install Visual Studio Code? [y/n]: "
if ! yn; then
  echo; return
fi
echo

which code >/dev/null 2>&1 || brew install --cask visual-studio-code
