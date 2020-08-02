#!/usr/bin/env sh
# General compiler

# File doesn't exist
[[ ! -e "$1" ]] && echo "File doesn't exist" && exit

file=$1
base=$(echo "$file" | sed "s/\..*//")

handlebang() {
    bang=$(head -n1 "$file")

    case "$bang" in
        *!/bin/bash|*!/bin/zsh|*!/bin/sh)
            "$file";;
        *!/bin/python)
            python "$file";;
        *!/bin/perl)
            perl "$file";;
        *)
            echo "Can't compile $file";;
    esac
}

case "$file" in
    *.md)
        pandoc -f markdown -t pdf -o "$base".pdf "$file" --number-sections -Fpandoc-crossref;;
    *.py)
        python "$file";;
    *.perl)
        perl "$file";;
    *.cpp)
        g++ -Wshadow -Wall -o "$base" "$file" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && \
        ./"$base";;
    *.c)
        gcc -Wshadow -Wall -o "$base" "$file" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && \
        ./"$base" ;;
    *) handlebang;;
esac
