# My Dotfiles

This is a git to backup my dotfiles. I use GNU stow

Run `run.sh` to easily "stow" everything

# Some notes

## NeoVim

- For rest.nvim, hererocks needs to be installed and the installation using packer.nvim might fail.
  In case it fails, you need to install hererocks manually by running the command
  ```bash
  # Do note that the part "2.1.1702233742" might need to be changed to the latest version.
  python3 ~/.cache/nvim/packer_hererocks/hererocks.py --verbose -j 2.1.0-beta3 -r latest ~/.cache/nvim/packer_hererocks/2.1.1702233742
  ```
  From: https://github.com/wbthomason/packer.nvim/issues/1266
