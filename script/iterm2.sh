#!/usr/bin/env sh

brew cask list iterm2 >/dev/null 2>&1 && return

printf "Install iTerm2? [y/n]: "
if ! yn; then
  echo; return
fi
echo

brew cask install iterm2
