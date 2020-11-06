#!/bin/sh

logger "Zzz..."
playerctl pause
/home/josep/script/lockScreen.sh &
systemctl suspend
