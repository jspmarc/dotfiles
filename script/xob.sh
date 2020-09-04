#!/usr/bin/env sh
# A script to update xob when volume cahnges

backlfile="/tmp/xob_backl_pipe"
volfile="/tmp/xob_vol_pipe"

vol() {
    if [[ "$1" == "inc" ]]; then
        amixer -q sset Master 1%+
    elif [[ "$1" == "dec" ]]; then
        amixer -q sset Master 1%-
    fi

    v=$(amixer sget Master | tail -n1 |  awk '{print $5}' | \
        sed -r 's/[%\[]//gp' | sed -r 's/\]//gp' | head -n1)
    echo "$v" > "$volfile"
}

backl() {
    if [[ "$1" == "inc" ]]; then
        xbacklight -inc 5
    elif [[ "$1" == "dec" ]]; then
        xbacklight -dec 5
    fi

    b=$(xbacklight -getf)
    echo "$b" > "$backlfile"
}

if [[ -z $(pgrep xob) ]]; then # first run

    if [[ ! -e "$volfile" ]]; then
        touch "$volfile"
    fi

    if [[ ! -e "$backlfile" ]]; then
        touch "$backlfile"
    fi

    tail -f "$volfile" | xob -s vol & > /dev/null 2>&1
    tail -f "$backlfile" | xob -s backl & > /dev/null 2>&1
else
    if  [[ "$1" == "vol" ]]; then
        vol "$2"
    elif [[ "$1" == "backl" ]]; then
        backl "$2"
    fi
fi
