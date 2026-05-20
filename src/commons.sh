#!/bin/bash

function myprofile-src-path() {
    echo "$MY_PROFILE_PATH/src"
}

function myprofile-os-path() {
    echo "$(myprofile-src-path)/os"
}

function myprofile-tools-path() {
    echo "$(myprofile-src-path)/tools"
}

function myprofile-personal-path() {
    echo "$(myprofile-src-path)/personal"
}

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
