#!/bin/env sh
# A script to update xob when volume cahnges

backlfile="/tmp/xob_backl_pipe"
volfile="/tmp/xob_vol_pipe"

vol() {
    v=$(amixer sget Master | tail -n1 |  awk '{print $5}' | \
        sed -r 's/[%\[]//gp' | sed -r 's/\]//gp' | head -n1)

    [[ "$1" == "inc" ]] && amixer -q sset Master 2%+
    [[ "$1" == "dec" ]] && amixer -q sset Master 2%-
    [[ "$1" == "mute" ]] && amixer -q sset Master toggle

    m=$(amixer sget Master | tail -n1 |  awk '{print $6}' | \
        sed -r 's/[%\[]//gp' | sed -r 's/\]//gp' | head -n1)

    [[ "$m" == "on" ]] && echo "$v" > "$volfile"
    [[ "$m" == "off" ]] && echo "$v"! > "$volfile"
}

backl() {
    [[ "$1" == "inc" ]] && xbacklight -inc 5
    [[ "$1" == "dec" ]] && xbacklight -dec 5

    b=$(xbacklight -get)
    echo "$b" > "$backlfile"
}

if [[ -z $(pgrep xob) ]]; then # first run

    [[ ! -e "$volfile" ]] && touch "$volfile"
    [[ ! -e "$backlfile" ]] && touch "$backlfile"

    tail -f "$volfile" | xob -s vol & > /dev/null 2>&1
    tail -f "$backlfile" | xob -s backl & > /dev/null 2>&1
else
    [[ "$1" == "vol" ]] && vol "$2"
    [[ "$1" == "backl" ]] && backl "$2"
fi
