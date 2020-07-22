#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='\e[0;33m\A |\e[0m \e[0;34m\W\e[0m \e[0;1m\e[0;32m❯\e[0m '

source ~/zsh-files/.zsh_funcs
#source ~/zsh-files/.zsh_alias
source ~/zsh-files/zsh-colored-man-pages.zsh

# Sourcing autojump
#[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
