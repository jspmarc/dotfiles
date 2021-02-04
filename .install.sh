#!/bin/bash

declare -A pkg_lists
pkg_counter=0
add_pkg() {
    [[ -z "$1" ]] && echo "Failed to add package (no package name specified)" \
    && exit

    pkg_lists["$pkg_counter"]="$1"
    pkg_counter=$((pkg_counter + 1))
}

# Checks for the availability of package managers
pkg_mgrs=(apt pacman)
for p in ${pkg_mgrs[@]}; do
    if [[ -e $(which "$p" 2> /dev/null) ]]; then
        pkg_mgr=$p
        break
    fi
done

add_pkg "gcc"
add_pkg "vim"
add_pkg "zsh"
add_pkg "nodejs"
add_pkg "npm"

echo "${pkg_lists[@]}"

#pkg_lists=(neovim git)

# Install pkgs and update pakage managers
if [[ "$pkg_mgr" == "pacman" ]]; then # archlinux based machine
    add_pkg "base"
    add_pkg "man-db"
    add_pkg "python"
    add_pkg "python2"
    add_pkg "python-pip"
    add_pkg "python2-pip"

    sudo pacman -Syu
elif [[ "$pkg_mgr" == "apt" ]]; then # debian/ubuntu based machines
    add_pkg "g++"
    add_pkg "man"
    add_pkg "python"
    add_pkg "python3"
    add_pkg "python-pip"
    add_pkg "python3-pip"

    sudo apt update
    sudo apt upgrade
fi
