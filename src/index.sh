#!/bin/bash

export MY_PROFILE_PATH="$HOME/.myprofile"

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

function run-all() {
    local commands
    commands=("$@")

    for cmd in "${commands[@]}"; do
        echo
        eval "$cmd"
    done
}

# aliases
alias re-source=". $MY_PROFILE_PATH/src/index.sh"

function update-myprofile() {

    if [ -d "$MY_PROFILE_PATH" ]; then
        echo "[UPDATE] Updating myprofile in $MY_PROFILE_PATH ..."
        cd "$MY_PROFILE_PATH" > /dev/null
        git fetch --all > /dev/null
        git pull --rebase > /dev/null
        cd - > /dev/null

        echo "[UPDATE] Loading profile ..."
        re-source

        echo "[UPDATE] done"
    else
        echo "[UPDATE] [Error] Not found folder: $MY_PROFILE_PATH" >&2
    fi
}

# import OS profile
OS_DIR="$MY_PROFILE_PATH/src/os"
. "$OS_DIR/load-os.sh"

# import tools profile
TOOLS_DIR="$MY_PROFILE_PATH/src/tools"
. "$TOOLS_DIR/load-tools.sh"

# import personal profile
PERSONAL_DIR="$MY_PROFILE_PATH/src/personal"
. "$PERSONAL_DIR/user.sh"
. "$PERSONAL_DIR/company.sh"
