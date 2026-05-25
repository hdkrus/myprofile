#!/bin/bash

export MY_PROFILE_PATH="$HOME/.myprofile"

source "$MY_PROFILE_PATH/src/commons.sh"

function run-all() {
    local commands
    commands=("$@")

    for cmd in "${commands[@]}"; do
        echo
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
            echo "[UPDATE] Updating myprofile in $MY_PROFILE_PATH ..."
            git pull --rebase -q
            cd - > /dev/null

            echo "[UPDATE] Reloading profile ..."
            re-source

            echo "[UPDATE] done"
        fi
    else
        echo "[UPDATE] [Error] Not found folder: $MY_PROFILE_PATH" >&2
    fi
}

# import OS profile
source "$(myprofile-os-path)/load-os.sh"

# import tools profile
source "$(myprofile-tools-path)/load-tools.sh"

# import personal profile
source "$(myprofile-personal-path)/user.sh"
source "$(myprofile-personal-path)/company.sh"
