#!/usr/bin/env sh

export DOTFILES=$(cd "$(dirname "$0")"; pwd)

yn() {
  while true; do
    read response
    case $response in
        [Yy]* ) return 0;;
        [Nn]* ) return 1;;
        * ) echo "Please answer with 'y' or 'n'.";;
    esac
  done
}

type brew >/dev/null 2>&1 || {
  echo "🍺  Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

type zsh >/dev/null 2>&1 || {
  echo "💻  Installing zsh..."
  brew install zsh
  chsh -s $(which zsh)
}

type git >/dev/null 2>&1 || {
  echo "🔀  Installing git..."
  brew install git
}

brew list zplug >/dev/null 2>&1 || {
  echo "📦  Installing zplug..."
  brew install zplug
}

brew list asdf >/dev/null 2>&1 || {
  echo "🪛  Installing asdf..."
  brew install asdf
}

source "$DOTFILES/script/iterm2.sh"
source "$DOTFILES/script/nvim.sh"
source "$DOTFILES/script/vscode.sh"
source "$DOTFILES/script/symlinks.sh"

echo; echo "✨  Done"
