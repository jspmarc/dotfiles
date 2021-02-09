#!/bin/bash

echo "Installing Powerlevel10k..."

[[ -d ~/sources/ ]] || mkdir ~/sources/

if [[ -e "$(which git 2> /dev/null)" ]]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        ~/sources/powerlevel10k
else
    echo "Git not installed, failed to install Powerlevel10k"
fi

echo "Done installing Powerlevel10k."
