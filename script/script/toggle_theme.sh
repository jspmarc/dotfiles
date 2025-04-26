#!/bin/bash

# Define the themes and settings for dark and light modes
DARK_GTK4="prefer-dark"
LIGHT_GTK4="prefer-light"

DARK_GTK3="adw-gtk3"
LIGHT_GTK3="Adwaita"

# DARK_QT="kvantum-dark"
# LIGHT_QT="kvantum-light"

# Get the current GTK4 color scheme
CURRENT_GTK4=$(gsettings get org.gnome.desktop.interface color-scheme)

# Get the current GTK3 theme
CURRENT_GTK3=$(gsettings get org.gnome.desktop.interface gtk-theme)

# Get the current QT theme
# CURRENT_QT=$(printenv QT_QPA_PLATFORMTHEME)

# Function to switch to dark mode
switch_to_dark() {
    gsettings set org.gnome.desktop.interface color-scheme "$DARK_GTK4"
    gsettings set org.gnome.desktop.interface gtk-theme "$DARK_GTK3"
    # export QT_QPA_PLATFORMTHEME="$DARK_QT"
    echo "Switched to dark mode."
}

# Function to switch to light mode
switch_to_light() {
    gsettings set org.gnome.desktop.interface color-scheme "$LIGHT_GTK4"
    gsettings set org.gnome.desktop.interface gtk-theme "$LIGHT_GTK3"
    # export QT_QPA_PLATFORMTHEME="$LIGHT_QT"
    echo "Switched to light mode."
}

# Determine the current mode and switch to the opposite
if [ "$CURRENT_GTK4" == "'$DARK_GTK4'" ] && [ "$CURRENT_GTK3" == "'$DARK_GTK3'" ]; then
    switch_to_light
else
    switch_to_dark
fi
