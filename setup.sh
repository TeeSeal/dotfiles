#!/usr/bin/env sh

cd "$(dirname "$0")"
export DOTFILES=$(pwd)

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

# zplug acts weird with `type` so gotta check with brew
brew list zplug >/dev/null 2>&1 2>&1 || {
  echo "📦  Installing zplug..."
  brew install zplug
}

source ./script/iterm2
source ./script/nvim
source ./script/vscode
source ./script/symlinks

echo; echo "✨  Done"
