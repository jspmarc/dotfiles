#!/bin/bash

echo "Softlinking files on home dir (""$HOME"")..."

[[ -e "$HOME/.bashrc" ]] && mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
[[ -e "$HOME/.zshrc" ]] && mv "$HOME/.bashrc" "$HOME/.zshrc.bak"
[[ -e "$HOME/.vimrc" ]] && mv "$HOME/.vimrc" "$HOME/.vimrc.bak"
[[ -e "$HOME/.Xmodmap" ]] && mv "$HOME/.Xmodmap" "$HOME/.Xmodmap.bak"

shopt -s dotglob
for f in *; do
    # Fix this if statement
    [[ "$f" != ".config" && \
       "$f" != "automation" && \
       "$f" != ".git" && \
       "$f" != ".gitignore" && \
       "$f" != "install-dotfiles.sh" && \
       "$f" != "README.md" && \
       "$f" != "vimspector_defaults.json" ]] && \
        ln -s "$(pwd)/$f" "$HOME"
done

echo

echo "Softlinking files on .config dir..."
[[ -d "$HOME/.config" ]] || mkdir "$HOME/.config"
for f in .config/*; do
    [[ "$f" != "." && "$f" != ".." ]] && \
        ln -s "$(pwd)/$f" "$HOME/.config"
done
shopt -u dotglob

echo ""
echo "Done softlinking files."
