#!/usr/bin/env sh

# upgrading mirrorlist
/usr/bin/notify-send "updating mirrorlist"
#/usr/bin/reflector --latest 200 --age 48 --sort rate --save /etc/pacman.d/mirrorlist
/usr/bin/reflector --latest 200 --sort rate --save /etc/pacman.d/mirrorlist

# upgrading pacman
/usr/bin/notify-send "updating pacman"
/usr/bin/pacman -Syu
