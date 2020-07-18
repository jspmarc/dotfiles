#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Sourcing autojump
#[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
