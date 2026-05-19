#!/bin/bash

export MY_PROFILE_PATH="$HOME/.myprofile"

function install-myprofile() {
    if [ ! -d "$MY_PROFILE_PATH" ]; then
        echo "Installing myprofile in $MY_PROFILE_PATH ..."
        cd "$HOME" > /dev/null
        git clone https://github.com/hdkrus/myprofile.git > /dev/null
        mv $HOME/myprofile $MY_PROFILE_PATH
        cd - > /dev/null
    else
        echo "Folder '$MY_PROFILE_PATH' already exists" >&2
    fi

    echo "Loading myprofile ..."
    . "$MY_PROFILE_PATH/src/index.sh"
    echo "done"

    configure-myprofile-if-needed
}

function configure-myprofile-if-needed() {
    local RC_FILE
    if [[ "$(is-zsh)" == "yes" ]]; then
        RC_FILE="$HOME/.zshrc"
    elif [[ "$(is-bash)" == "yes" ]]; then
        RC_FILE="$HOME/.bashrc"
    fi

    local SOURCE_LINE
    SOURCE_LINE=". $MY_PROFILE_PATH/src/index.sh"

    local SEARCH
    SEARCH=$(cat "$RC_FILE" | \grep "$SOURCE_LINE")
    if [ -z "$SEARCH" ]; then
        echo "" >> "$RC_FILE"
        echo "# load myprofile" >> "$RC_FILE"
        echo "$SOURCE_LINE" >> "$RC_FILE"
        echo "" >> "$RC_FILE"
    fi

    . "$MY_PROFILE_PATH/src/index.sh"
}

install-myprofile
