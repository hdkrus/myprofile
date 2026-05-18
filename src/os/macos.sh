#!/bin/bash

. "$OS_DIR/.unix_based.sh"

function update-os() {
    sudo softwareupdate --install --all --verbose
}
