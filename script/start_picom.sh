#!/usr/bin/env bash

# Terminate already running picom instances
while [[ -n $(pgrep picom) ]];
do
	killall -q picom
done 
#[[ -n "$(pgrep picom)" ]] && killall -q picom

# Launch picom
#picom -bc --experimental-backends
picom -bc

#notify-send "Picom launched"
