#!/bin/bash

case "$1" in
    portion)
        grim -g "$(slurp)" - | wl-copy
        ;;
    screen)
        grim -o "$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')" - | wl-copy
        ;;
    window)
        grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.focused? and .pid?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')" - | wl-copy
        ;;
    *)
        echo "Usage: $0 {portion|screen|window}"
        exit 1
        ;;
esac
