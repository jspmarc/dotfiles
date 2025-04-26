#!/bin/bash

case $1 in
    "show")
        # dunstctl history > /tmp/dunst_history.json
        # can I make it so the drun menu shows multiline if the text contains \n, AI?
        wofi --show dmenu --width=600 --height=400 --cache-file=/dev/null \
            --allow-markup --allow-images \
            < <(dunstctl history | jq '.data[] | .[] | .message.data' | sed 's/^"//;s/"$//;s/\\n/    /g')
        ;;
    *)
        count=$(dunstctl count waiting)
        if [ "$count" -gt 0 ]; then
            echo "{\"text\": \"󱅫\", \"class\": \"has-notifications\", \"tooltip\": \"$count notifications pending\"}"
        else
            echo "{\"text\": \"󰂚\", \"class\": \"no-notifications\"}"
        fi
        ;;
esac

