#!/bin/bash

# Power button script for Waybar

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
    hyprlock --immediate
}

option_lock=" Lock"
option_sleep="⏾ Sleep"
option_restart="⭮ Restart"
option_shutdown=" Shutdown"

# Create menu options
options="$option_lock\n$option_sleep\n$option_restart\n$option_shutdown"

# Show wofi menu and get user selection
selected=$(echo -e "$options" | wofi --dmenu --prompt "Power Menu" --width 200 --height 220 --cache-file /dev/null --location 0)

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
esac
