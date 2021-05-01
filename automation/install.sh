#!/bin/bash

declare -A pkg_lists
pkg_counter=0
add_pkg() {
    if [[ -z "$1" ]]; then
        >&2 echo "Failed to add package (no package name specified)"
    else
        pkg_lists["$pkg_counter"]="$1"
        pkg_counter=$((pkg_counter + 1))
    fi
}

echo "Installing packages..."

# Checks for the availability of package managers
pkg_mgrs=(apt pacman)
for p in "${pkg_mgrs[@]}"; do
    if [[ -e $(which "$p" 2> /dev/null) ]]; then
        pkg_mgr=$p
        break
    fi
done

# User chosen packages
for pkg in "$@"; do
    add_pkg "$pkg"
done

add_pkg "gcc"
add_pkg "zsh"
# add_pkg "nodejs"
# add_pkg "npm"
# add_pkg "cmake"
add_pkg "curl"
add_pkg "fzf"
add_pkg "man-db"
add_pkg "man-pages"
add_pkg "texinfo"

# Install pkgs and update pakage managers
if [[ "$pkg_mgr" == "pacman" ]]; then # archlinux based machine
    add_pkg "base"
    add_pkg "base-devel"
    add_pkg "man-db"
    # add_pkg "python"
    # add_pkg "python2"
    # add_pkg "python-pip"
    # add_pkg "python2-pip"
    add_pkg "networkmanager"

    sudo pacman -Syu "${pkg_lists[@]}"

    # Installing yay
    echo "Installing Yay AUR package manager..."
    sudo git clone https://aur.archlinux.org/paru.git /opt
    sudo chown -R "$USER":"$USER" /opt/paru
    cd /opt/paru || exit 1
    makepkg -si
    cd - || exit 1
    echo "Done installing Paru"
elif [[ "$pkg_mgr" == "apt" ]]; then # debian/ubuntu based machines
    # add_pkg "g++"
    add_pkg "man"
    # add_pkg "python"
    # add_pkg "python3"
    # add_pkg "python-pip"
    # add_pkg "python3-pip"

    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install "${pkg_lists[@]}"
else
    echo "go install Arch Linux"
fi

echo "Done instaling packages."
