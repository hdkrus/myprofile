#!/bin/bash

source "$(myprofile-os-path)/.unix_based.sh"

function update-os() {
    echo-color yellow "Updating MacOS ..."
    sudo softwareupdate --install --all --verbose
}

load-tool-if-exists mas
