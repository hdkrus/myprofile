#!/bin/sh

if [[ $OSTYPE == 'darwin'* ]]; then
    . "$OS_DIR/macos.sh"
elif [[ $OSTYPE == 'linux'* ]]; then
    if uname -a | grep -q '^Linux.*microsoft'; then
        . "$OS_DIR/wsl.sh"
    else
        . "$OS_DIR/linux.sh"
    fi
fi

function update-brew() {
  echo "Updating brew..."
  brew update
  brew upgrade
  brew cleanup
}

function update-all() {
  update-os
  update-brew
}
