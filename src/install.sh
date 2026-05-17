#!/bin/bash

PROFILE_DIR="$HOME/.myprofile"

function install-myprofile() {
    if [ ! -d "$PROFILE_DIR" ]; then
        echo "Installing myprofile in $PROFILE_DIR ..."
        cd "$HOME" > /dev/null
        git clone https://github.com/hdkrus/bash-profile.git > /dev/null
        mv $HOME/bash-profile $PROFILE_DIR
        cd - > /dev/null
    else
        echo "Folder '$PROFILE_DIR' already exists" >&2
    fi

    echo "Loading myprofile ..."
    . "$PROFILE_DIR/src/index.sh"
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
    SOURCE_LINE=". $PROFILE_DIR/src/index.sh"

    local SEARCH
    SEARCH=$(cat "$RC_FILE" | \grep "$SOURCE_LINE")
    if [ -z "$SEARCH" ]; then
        echo "" >> "$RC_FILE"
        echo "# load myprofile" >> "$RC_FILE"
        echo "$SOURCE_LINE" >> "$RC_FILE"
        echo "" >> "$RC_FILE"
    fi
}

install-myprofile
