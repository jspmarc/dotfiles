#!/bin/sh
[[ -f /tmp/ss.png ]] && rm /tmp/ss.png
scrot -fs -q90 /tmp/ss.png
xclip -sel clip -t image/png /tmp/ss.png
notify-send "Screenshot taken"
#rm /tmp/ss.png
