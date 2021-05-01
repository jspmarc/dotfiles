#!/bin/bash

cd "$(dirname "$0")" || exit 1

echo "Installing jspmarc/dotfiles..."

[[ -d ~/sources/ ]] || mkdir ~/sources/

./automation/softlink.sh || echo "Something happened while creating softlink"
./automation/install.sh || echo "Something happened when installing packages"
echo "Do you want to install powerlevel10k (ZSH theme and plugin manager)? [y/n]"
read -r y
[[ "$y" == "y" ]] && ./automation/install-powerlevel10k.sh ||\
    echo "Something happened while installing powerlevel10k"
echo "Do you want to install vim plug ((Neo)Vim plugin manager)? [y/n]" ||\
    echo "Something happened while installing vim-plug"
read -r y
[[ "$y" == "y" ]] && ./automation/install-vim-plug.sh

echo ""
echo "All done."
