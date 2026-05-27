#!/bin/bash

# go to previous directory
alias back-path='cd -'

# enhanced listing
alias l="ls -alhs --color"
alias lsa="ls -ahl"

# makes `less` command more usable
# alias less="less +G -E -X"

# use cat as pager instead of less
export PAGER=cat

# makes `grep`command output more interesting
alias grep='grep -n --color=auto'

# get all processes using a port
alias process-with-port="netstat -na | grep $1"
#alias process-with-port="sudo lsof –nP –i :$1"

# shutdown
alias shutdown-os='sudo shutdown -h now'

# restart
alias restart-os='sudo shutdown -r now'

# signing files
alias signfile='gpg -ab'

# show all processes
alias psa="ps -ahl"

# watch every second
alias w='watch -n 1 -c'

# change directory and list
function cd() {
    builtin cd "$@" && lsa
}

# kill process
function kill-process() {
    {
        kill -9 "$1" && echo ''
    } || {
        sudo kill -9 "$1"
    }
}
