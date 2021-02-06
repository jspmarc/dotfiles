#!/bin/bash

echo "Installing jspmarc/dotfiles..."

[[ -d ~/sources/ ]] || mkdir ~/sources/

./automation/softlink.sh
./automation/install.sh
./automation/install-powerlevel10k.sh

echo ""
echo "All done."
