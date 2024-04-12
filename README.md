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

## Tmux

- For plugins, need to install `tmux-plugins/tpm`
- For italic and strikethrough texts, have to install `x.txt`
  from https://github.com/tmux/tmux/issues/1137#issuecomment-339493951
