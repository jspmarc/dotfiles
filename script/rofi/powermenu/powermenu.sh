#!/bin/bash

shutdown=$(echo " Shutdown")
reboot=$(echo " Reboot")
sleep=$(echo "Zz Sleep")
logout=$(echo " Logout")
cancel=$(echo "X Cancel")

selected=$(echo "$shutdown
$reboot
$sleep
$logout
$cancel" | rofi -dmenu -config $HOME/script/rofi/powermenu/powermenu.rasi -p " ")

# exits if selection is empty
[[ -z $selected ]] && exit

case $selected in
    "$shutdown")
        #notify-send "shutdown"
        systemctl poweroff
        ;;
    "$reboot")
        #notify-send "reboot"
        systemctl reboot
        ;;
    "$sleep")
        #notify-send "sleep"
        systemctl suspend
        ;;
    "$logout")
        #notify-send "logout"
        #amixer sset Master mute
        if [[ $XDG_SESSION_DESKTOP == "xmonad" ]]; then
            echo "Yes
no"\
            | rofi -dmenu -config $HOME/script/rofi/powermenu/powermenu.rasi -p "Logout? "
        else
            playerctl pause
            i3-msg exit
            bspc quit
        fi
        #if [[ $XDG_SESSION_DESKTOP == "i3" ]]; then
            #i3-msg exit
        #elif [[ $XDG_SESSION_DESKTOP == "bspwm" ]]; then
            #bspc quit
        #fi
        ;;
    "$cancel")
        #notify-send "cancel"
        exit
        ;;
    *)
        notify-send "You found me!"
        ;;
esac
