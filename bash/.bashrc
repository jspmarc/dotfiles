#
# ~/.bashrc
#

function git_prompt_color {
    local git_status="$(git status 2> /dev/null)"

    if [[ ! $git_status =~ "working directory clean" ]]; then
        echo -e $COLOR_RED
    elif [[ $git_status =~ "Your branch is ahead of" ]]; then
        echo -e $COLOR_ORANGE
    elif [[ $git_status =~ "nothing to commit" ]]; then
        echo -e $COLOR_GREEN
    else
        echo -e $COLOR_OCHRE
    fi
}

function git_prompt_branch {
        local git_status="$(git status 2>/dev/null)"
        local on_branch="On branch ([^${IFS}]*)"
        local on_commit="HEAD detached at ([^${IFS}*)"

        if [[ $git_status =~ $on_branch ]]; then
            local branch=${BASH_REMATCH[1]}
            echo "($branch)"
        elif [[ $git_status =~ $on_commit ]]; then
            local commit=${BASH_REMATCH[1]}
            echo "($commit)"
        fi
}

if [ -e /usr/bin/fet.sh ]; then
    fet.sh
elif [ -e /usr/bin/pfetch ]; then
    pfetch
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
COLOR_RED='\e[0;31m'
COLOR_ORANGE='\e[0;33m'
COLOR_GREEN='\e[0;32m'
COLOR_OCHRE='\e[38;5;95m'
COLOR_BLUE='\e[0;34m'
COLOR_WHITE='\e[0;37m'
COLOR_RESET='\e[0m'

#PS1="$(git_prompt_color) $(git_prompt_branch) $COLOR_RESET $COLOR_GREEN | "
PS1="$COLOR_ORANGE\A | " # Show current time
PS1+="$COLOR_RESET" # Resets color
PS1+="$COLOR_BLUE\W$COLOR_RESET " # Shows current working directory
PS1+="\e[0;1m$COLOR_GREEN❯$COLOR_RESET " # Shows the ❯ prompt

source ~/zsh-files/zsh_funcs
#source ~/zsh-files/.zsh_alias
source ~/zsh-files/zsh-colored-man-pages.zsh

# Sourcing autojump
#[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

eval "$(starship init bash)"
