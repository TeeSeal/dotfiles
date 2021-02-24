#!/usr/bin/env sh

brew list --cask iterm2 >/dev/null 2>&1 && return

printf "Install iTerm2? [y/n]: "
if ! yn; then
  echo; return
fi
echo

brew install --cask iterm2
