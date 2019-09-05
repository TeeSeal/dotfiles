#!/usr/bin/env sh

printf "Install Visual Studio Code? [y/n]: "
if ! yn; then
  echo; return
fi
echo

which code >/dev/null 2>&1 || brew cask install visual-studio-code

VSCODE_USER="$HOME/Library/Application Support/Code/User"

ln -sf "$DOTFILES/vscode/settings.json" "$VSCODE_USER/settings.json"
ln -sf "$DOTFILES/vscode/keybindings.json" "$VSCODE_USER/keybindings.json"
ln -sf "$DOTFILES/vscode/snippets" "$VSCODE_USER/" # snippets is a directory

echo "✅  linked config files"
echo "🚚  installing extensions"

for ext in $(cat "$DOTFILES/vscode/extensions.txt"); do
  code --install-extension "$ext" || true
done
