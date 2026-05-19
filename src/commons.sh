#!/bin/bash

function is-bash() {
    if [[ "$SHELL" == *"/bash" ]]; then
        echo "yes"
    else
        echo "no"
    fi
}

function is-zsh() {
    if [[ "$SHELL" == *"/zsh" ]]; then
        echo "yes"
    else
        echo "no"
    fi
}
