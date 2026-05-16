#!/bin/bash

function get-os() {
    if [[ $OSTYPE == 'darwin'* ]]; then
        echo "macos"
    elif [[ $OSTYPE == 'linux'* ]]; then
        echo "linux"
    else
        echo "unknown"
    fi
}

function is-mac() {
    local OS
    OS=$(get-os)
    if [[ "$OS" == 'macos' ]]; then
        echo 'yes'
    else
        echo 'no'
    fi
}

function is-linux() {
    local OS
    OS=$(get-os)
    if [[ "$OS" == 'linux' ]]; then
        echo 'yes'
    else
        echo 'no'
    fi
}

function is-wsl() {
    local OS
    OS=$(get-os)
    if [[ "$OS" == 'linux' ]]; then
        if uname -a | grep -q '^Linux.*microsoft'; then
            echo 'yes'
        else
            echo 'no'
        fi
    else
        echo 'no'
    fi
}

export UPDATE_LIST=(
    "update-os"
)

function update-all() {
  run-all "${UPDATE_LIST[@]}"
}

# run

if [[ "$(is-mac)" == "yes" ]]; then
    . "$OS_DIR/macos.sh"
elif [[ "$(is-wsl)" == "yes" ]]; then
    . "$OS_DIR/wsl.sh"
elif [[ "$(is-linux)" == "yes" ]]; then
    . "$OS_DIR/linux.sh"
fi
