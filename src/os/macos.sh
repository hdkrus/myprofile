#!/bin/bash

source "$(myprofile-os-path)/.unix_based.sh"

function update-os() {
    sudo softwareupdate --install --all --verbose
}
