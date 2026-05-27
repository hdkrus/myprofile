#!/bin/bash

export BREW_HOME_BIN="/home/linuxbrew/.linuxbrew/bin"
export BREW_HOME_SBIN="/home/linuxbrew/.linuxbrew/sbin"
export PATH="$PATH:$BREW_HOME_BIN:$BREW_HOME_SBIN"

UPDATE_LIST+=("update-brew")

function update-brew() {
  echo-color yellow "Updating brew..."
  brew update
  brew upgrade
  brew cleanup
}
