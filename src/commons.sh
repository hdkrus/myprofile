#!/bin/bash

function is-bash() {
    if [ -n "$BASH_VERSION" ]; then
        echo "yes"
    else
        echo "no"
    fi
}

function is-zsh() {
    if [ -n "$ZSH_VERSION" ]; then
        echo "yes"
    else
        echo "no"
    fi
}
