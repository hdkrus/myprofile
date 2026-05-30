#!/bin/bash

function echo-color() {
    local fg="$1"
    local msg="$2"
    local color_code=""

    if [[ -z "$msg" ]]; then
        msg="$fg"
        fg=""
    else
        fg=$(lower "$fg")
    fi

    case "$fg" in
        black)   color_code="\033[30m" ;;
        red)     color_code="\033[31m" ;;
        green)   color_code="\033[32m" ;;
        yellow)  color_code="\033[33m" ;;
        blue)    color_code="\033[34m" ;;
        magenta) color_code="\033[35m" ;;
        cyan)    color_code="\033[36m" ;;
        white)   color_code="\033[37m" ;;
        *)       color_code="" ;;
    esac

    if [[ -n "$color_code" ]]; then
        printf "${color_code}${msg}\033[0m\n"
    else
        printf "${msg}\n"
    fi
}

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
