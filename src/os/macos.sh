#!/bin/bash

source "$(myprofile-os-path)/.unix_based.sh"

function update-os() {
    echo "Updating MacOS ..."
    sudo softwareupdate --install --all --verbose
}
