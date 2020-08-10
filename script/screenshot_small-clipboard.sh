#!/usr/bin/env sh
[[ -f /tmp/ss.png ]] && rm /tmp/ss.png
killall picom
scrot -fs -q90 /tmp/ss.png
~/script/start_picom.sh
xclip -sel clip -t image/png /tmp/ss.png
notify-send "Screenshot taken"
#rm /tmp/ss.png
