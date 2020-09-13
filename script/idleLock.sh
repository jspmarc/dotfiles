#!/bin/env sh

display="eDP-1"

xidlehook \
    --not-when-fullscreen \
    --not-when-audio \
    --timer 60 \
    "xrandr --output $display --brightness 0.3" \
    "xrandr --output $display --brightness 1" \
    --timer 120 \
    "/home/josep/script/lockScreen.sh" \
    "xrandr --output $display --brightness 1" \
    --timer 3600 \
    "systemctl suspend" \
    "xrandr --output $display --brightness 1"
