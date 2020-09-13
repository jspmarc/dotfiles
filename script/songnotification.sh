#!/bin/env sh
song=$(playerctl metadata --format "{{title}} - {{artist}}
{{album}}")
notify-send "$song"
