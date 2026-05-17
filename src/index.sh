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

function curr-dir() {
    local DIR

    if [ "$(is-zsh)" = "yes" ]; then
        cd "$(dirname "${(%):-%x}")" > /dev/null
    elif [ "$(is-bash)" = "yes" ]; then
        cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null
    fi
    
    DIR="$(pwd)"
    cd - > /dev/null
    echo "$DIR"
}

# current dir
function set-sources-dir() {
    export SOURCES_DIR="$(curr-dir)"
}

set-sources-dir

function run-all() {
    local commands
    commands=("$@")

    for cmd in "${commands[@]}"; do
        echo
        eval "$cmd"
    done
}


function update-myprofile() {
    local PROFILE_DIR
    PROFILE_DIR="$HOME/.myprofile"

    if [ -d "$PROFILE_DIR" ]; then
        echo "Updating myprofile in $PROFILE_DIR ..."
        cd "$PROFILE_DIR" > /dev/null
        git fetch --all > /dev/null
        git pull > /dev/null
        cd - > /dev/null
    else
        echo "[Error] Not found folder: $PROFILE_DIR" > &2
    fi
}

# aliases
alias re-source=". $SOURCES_DIR/index.sh"

# import OS profile
OS_DIR="$SOURCES_DIR/os"
. "$OS_DIR/load-os.sh"

# import tools profile
TOOLS_DIR="$SOURCES_DIR/tools"
. "$TOOLS_DIR/load-tools.sh"

# import personal profile
PERSONAL_DIR="$SOURCES_DIR/personal"
. "$PERSONAL_DIR/user.sh"
. "$PERSONAL_DIR/company.sh"
