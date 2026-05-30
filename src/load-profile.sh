#!/bin/bash

export MY_PROFILE_PATH="$HOME/.myprofile"

source "$MY_PROFILE_PATH/src/commons.sh"

function run-all() {
    local commands
    commands=("$@")

    for cmd in "${commands[@]}"; do
        eval "$cmd"
    done
}

# aliases
alias re-source="source $MY_PROFILE_PATH/src/load-profile.sh"

function update-myprofile() {

    if [ -d "$MY_PROFILE_PATH" ]; then
        
        cd "$MY_PROFILE_PATH" > /dev/null
        git fetch --all -q
        local outdated
        outdated=$(git rev-list --count HEAD..origin/main)

        if [[ "$outdated" != "0" ]]; then
            echo "Updating myprofile in $MY_PROFILE_PATH ..."
            git pull --rebase -q
            cd - > /dev/null

            echo "Reloading profile ..."
            re-source
        fi

        echo-color green "MyProfile is updated"
    else
        echo-color red "[Error] Not found folder: $MY_PROFILE_PATH" >&2
    fi
}

export UPDATE_LIST=(
    "update-myprofile"
    "update-os"
)

function update-all() {
    run-all "${UPDATE_LIST[@]}"
}

# import tools profile
source "$(myprofile-tools-path)/load-tools.sh"

# import OS profile
source "$(myprofile-os-path)/load-os.sh"
