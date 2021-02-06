#!/bin/bash

echo "Softlinking files on home dir ("$HOME")..."

[[ -e "$HOME/.bashrc" ]] && mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
[[ -e "$HOME/.zshrc" ]] && mv "$HOME/.bashrc" "$HOME/.zshrc.bak"
[[ -e "$HOME/.vimrc" ]] && mv "$HOME/.vimrc" "$HOME/.vimrc.bak"
[[ -e "$HOME/.Xmodmap" ]] && mv "$HOME/.Xmodmap" "$HOME/.Xmodmap.bak"

for f in $(ls -a .); do
    [[ "$f" != "." && "$f" != ".." && "$f" != ".config" && "$f" != "automation" \
        && "$f" != ".git" && "$f" != ".gitignore" && "$f" != "install-dotfiles.sh" \
        && "$f" != "README.md" ]] && \
        ln -s "$(pwd)/$f" "$HOME"
done

echo

echo "Softlinking files on .config dir..."
for f in $(ls -a .config); do
    [[ "$f" != "." && "$f" != ".." ]] && \
        ln -s "$(pwd)/.config/$f" "$HOME/.config"
done

echo ""
echo "Done softlinking files."
