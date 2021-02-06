#!/bin/bash

echo "Installing jspmarc/dotfiles..."

[[ -d ~/sources/ ]] || mkdir ~/sources/

./automation/softlink.sh
./automation/install.sh
echo "Do you want to install powerlevel10k (ZSH theme and plugin manager)? [y/n]"
read y
[[ "$y" == "y" ]] && ./automation/install-powerlevel10k.sh
echo "Do you want to install vim plug ((Neo)Vim plugin manager)? [y/n]"
read y
[[ "$y" == "y" ]] && ./automation/install-vim-plug.sh

echo ""
echo "All done."
