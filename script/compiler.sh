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
        #pandoc -f markdown -t pdf -o "$base".pdf "$file" --number-sections -Fpandoc-crossref;;
        pandoc -f markdown -t pdf -o "$base".pdf "$file" --number-sections --toc -Fpandoc-crossref --pdf-engine xelatex;;
    *.py)
        python "$file";;
    *.perl)
        perl "$file";;
    *.cpp|*.c)
        if [[ -z "$2" ]]; then
            echo "Standard not specified, using c18 for C and c++17 for C++"
            case "$file" in
                *.cpp)
                    g++ -std=c++17 -Wshadow -Wall -o "$base" "$file" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && \
                    ./"$base";;
                *.c)
                    gcc -std=c18 -Wshadow -Wall -o "$base" "$file" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && \
                    ./"$base";;
            esac
        else
            case "$file" in
                *.cpp)
                    g++ -std="$2" -Wshadow -Wall -o "$base" "$file" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && \
                    ./"$base";;
                *.c)
                    gcc -std="$2" -Wshadow -Wall -o "$base" "$file" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && \
                    ./"$base";;
            esac
        fi;;
    *) handlebang;;
esac
