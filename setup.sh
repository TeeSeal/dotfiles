#!/usr/bin/env sh

cd "$(dirname "$0")"
export DOTFILES=$(pwd)

echo $DOTFILES
# Install basic stuff first
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

type asdf >/dev/null 2>&1 || {
  echo "🔠  Installing asdf..."
  brew install asdf
}

./script/iterm2
./script/nvim
./script/vscode
./script/symlinks

echo; echo "✨  Done"
