#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export LANG=en_US.UTF-8
alias xresourcesreload='xrdb -merge ~/.Xresources'
alias i3-config-edit='vim ~/.config/i3/config'
export PATH="$PATH:$HOME/.local/bin"
. "$HOME/.cargo/env"
