#!/bin/bash

# modified from: https://www.reddit.com/r/hyprland/comments/1h4abmt/comment/lzx4j8g

# Define the themes and settings for dark and light modes
DARK_GTK4="prefer-dark"
LIGHT_GTK4="prefer-light"

DARK_GTK3="adw-gtk3-dark"
LIGHT_GTK3="adw-gtk3"

DARK_QT="kvantum-dark"
LIGHT_QT="kvantum-light"

hyprctl() {
    /usr/bin/hyprctl --instance 0 "$@"
}

# Function to switch to dark mode
switch_to_dark() {
    gsettings set org.gnome.desktop.interface color-scheme "$DARK_GTK4"
    gsettings set org.gnome.desktop.interface gtk-theme "$DARK_GTK3"
    export QT_QPA_PLATFORMTHEME="$DARK_QT"

    # hyprctl hyprpaper wallpaper "DP-2,/home/josep/Pictures/Wallpapers/eclipse.jpg"
    # hyprctl hyprpaper wallpaper "HDMI-A-1,/home/josep/Pictures/Wallpapers/eclipse.jpg"
    if [[ "$XDG_SESSION_DESKTOP" = "sway" ]]; then
        swaymsg 'output * bg ~/Pictures/Wallpapers/macos-sequoia-6400x3552-dark.jpg fill'
    fi
}

# Function to switch to light mode
switch_to_light() {
    gsettings set org.gnome.desktop.interface color-scheme "$LIGHT_GTK4"
    gsettings set org.gnome.desktop.interface gtk-theme "$LIGHT_GTK3"
    export QT_QPA_PLATFORMTHEME="$LIGHT_QT"

    # hyprctl hyprpaper wallpaper "DP-2,/home/josep/Pictures/Wallpapers/jap-vending-machine.jpeg"
    # hyprctl hyprpaper wallpaper "HDMI-A-1,/home/josep/Pictures/Wallpapers/jap-vending-machine.jpeg"
    if [[ "$XDG_SESSION_DESKTOP" = "sway" ]]; then
        swaymsg 'output * bg ~/Pictures/Wallpapers/macos-sequoia-6400x3552-light.jpg fill'
    fi
}

# Check if a parameter is provided
if [ "$1" == "dark" ]; then
    switch_to_dark
elif [ "$1" == "light" ]; then
    switch_to_light
else
    echo "Usage: $0 [dark|light]"
    exit 1
fi
