#!/bin/bash

UPDATE_LIST+=("update-brew")

function update-brew() {
  echo "Updating brew..."
  brew update
  brew upgrade
  brew cleanup
}
