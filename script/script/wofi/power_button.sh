#!/bin/bash

# Power button script for Waybar

SWAYSOCK="/run/user/$(id -u)/sway-ipc.$(id -u).$(pgrep -x sway).sock"

# Function to handle shutdown
shutdown() {
    systemctl poweroff
}

# Function to handle sleep
sleep() {
    systemctl suspend
}

# Function to handle restart
restart() {
    systemctl reboot
}

# Function to handle lock
lock() {
    if [[ -n "$SWAYSOCK" ]]; then
        swaylock -f -S --indicator --clock -F --effect-blur 10x10
    else
        hyprlock --immediate
    fi
}

# Function to handle logout
logout() {
    hyprctl dispatch exit
    swaymsg exit
}

option_lock="  Lock"
option_sleep="⏾  Sleep"
option_restart="⭮  Restart"
option_shutdown="  Shutdown"
option_logout="󰍃  Logout"

# Create menu options
options="$option_lock\n$option_sleep\n$option_logout\n$option_restart\n$option_shutdown"

killall wofi

# Show wofi menu and get user selection
selected=$(echo -e "$options" | wofi --dmenu \
    -Dclose_on_focus_loss=true \
    --config "$HOME/.config/wofi/power_button.config" \
    --style "$HOME/.config/wofi/power_button.css" \
    --prompt "Power Menu" --width 200 --height 250 \
    --hide-scroll --location 3)

# Handle the selection
case $selected in
    "$option_lock")
        lock
        ;;
    "$option_sleep")
        sleep
        ;;
    "$option_restart")
        restart
        ;;
    "$option_shutdown")
        shutdown
        ;;
    "$option_logout")
        logout
        ;;
esac
