#!/usr/bin/env bash

# Terminate already running bar instances
while [[ -n "$(pgrep polybar)" ]];
do
	killall -q polybar

	# If all your bars have ipc enabled, you can also use 
	polybar-msg cmd quit

	sleep 1s
done

# Launch bar
notify-send "starting polybar..." | tee -a /tmp/polybar1.log
#polybar bottom >>/tmp/bot-bar.log 2>&1 &
polybar top >>/tmp/top-bar.log 2>&1 &

#notify-send "Bars launched"

#while [[ -n "$(pgrep picom)" ]];
#do
	#/home/josep/script/start_picom.sh
	#sleep 1s
#done
