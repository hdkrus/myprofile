#!/bin/bash

export MY_PROFILE_PATH="$HOME/.myprofile"

function check-requirements() {
    if ! command -v git &> /dev/null; then
        echo "[REQUIREMENTS] [ERROR] Git is not found, please install git and then reinstall"
    fi
}

function install-myprofile() {
    local requirements
    requirements="$(check-requirements)"
    
    if [[ -z "$requirements" ]]; then
    
        if [ ! -d "$MY_PROFILE_PATH" ]; then        
            echo "[INSTALL] Installing myprofile in $MY_PROFILE_PATH ..."
            cd "$HOME" > /dev/null
    
            local GIT_REPO
            GIT_REPO="https://github.com/hdkrus/myprofile.git"
            echo "[INSTALL] Cloning from $GIT_REPO ..."
            git clone "$GIT_REPO" -q
    
            mv $HOME/myprofile $MY_PROFILE_PATH
            cd - > /dev/null
    
            echo "[INSTALL] done"
        else
            echo "[INSTALL] Folder '$MY_PROFILE_PATH' already exists" >&2
        fi
    
        configure-myprofile-if-needed

    else
        echo "$requirements" >&2
        exit 1
    fi
}

function configure-myprofile-if-needed() {

    source "$MY_PROFILE_PATH/src/commons.sh"

    local RC_FILE
    if [[ "$(is-zsh)" == "yes" ]]; then
        RC_FILE="$HOME/.zshrc"
    elif [[ "$(is-bash)" == "yes" ]]; then
        RC_FILE="$HOME/.bashrc"
    fi

    echo "[CONFIG] Looking for configurations in $RC_FILE"

    local SOURCE_LINE
    SOURCE_LINE="source $MY_PROFILE_PATH/src/load-profile.sh"

    local SEARCH
    SEARCH=$(cat "$RC_FILE" | \grep "$SOURCE_LINE")
    if [ -z "$SEARCH" ]; then
        echo "[CONFIG] Adding configurations to $RC_FILE ..."

        echo "" >> "$RC_FILE"
        echo "# load myprofile" >> "$RC_FILE"
        echo "$SOURCE_LINE" >> "$RC_FILE"
        echo "" >> "$RC_FILE"
    else
        echo "[CONFIG] $RC_FILE is already configured"
    fi

    echo "[CONFIG] Loading myprofile ..."
    source "$MY_PROFILE_PATH/src/load-profile.sh"
    echo "[CONFIG] done"
}

install-myprofile
