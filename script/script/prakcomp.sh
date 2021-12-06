#!/bin/env sh

# File doesn't exist
[[ ! -e "$1" ]] && echo "File doesn't exist" && exit

file=$1
base=$(echo "$file" | sed "s/\..*//")

gcc -std=c99 -Wshadow -Wall -lm -o "$base" -O2 "$@" -g && \
    ./"$base"

#gcc -std=c99 -Wshadow -Wall -lm -O2 -o "$base" "$@" -g -fsanitize=address \
    #-fsanitize=undefined -D_GLIBCXX_DEBUG && \
    #./"$base"

rm "./$base"
