#!/bin/bash

function is-macos() {
    local OS
    OS=$(uname | \grep Darwin)
    if [[ ! -z "$OS" ]]; then
        echo 'yes'
    else
        echo 'no'
    fi
}

function is-linux() {
    local OS
    OS=$(uname | \grep Linux)
    if [[ ! -z "$OS" ]]; then
        echo 'yes'
    else
        echo 'no'
    fi
}

function is-wsl() {
    local WSL
    WSL=$(uname -r | \grep WSL)
    if [[ ! -z "$WSL" ]]; then
        echo 'yes'
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

if [[ "$(is-macos)" == "yes" ]]; then
    source "$OS_DIR/macos.sh"
elif [[ "$(is-wsl)" == "yes" ]]; then
    source "$OS_DIR/wsl.sh"
elif [[ "$(is-linux)" == "yes" ]]; then
    source "$OS_DIR/linux.sh"
fi
