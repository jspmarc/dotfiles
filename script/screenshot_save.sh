#!/usr/bin/env sh
time=$(date +%m%d%y-%H.%M.%S)
path="$HOME"/Pictures/screenshots/"$time".png
mv /tmp/ss.png "$path"
echo "Image saved to "$path""
