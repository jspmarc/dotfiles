#!/bin/sh

logger "Zzz..."
playerctl pause
$HOME/script/lockScreen.sh &
systemctl suspend
