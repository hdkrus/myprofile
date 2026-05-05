#!/bin/bash

. "$OS_DIR/.unix_based.sh"

function linux-release() {
  cat /etc/os-release
}

function linux-id() {
  local id=$(linux-release | \grep ^ID=)

  if [[ "$id" =~ ^ID=(.+) ]]; then
    echo ${BASH_REMATCH[1]}
  else
    echo "<Unknown>"
  fi
}

function linux-id-based() {
  local like=$(linux-release | \grep ^ID_LIKE=)
  
  if [[ "$like" =~ ^ID_LIKE=(.+) ]]; then
    echo ${BASH_REMATCH[1]}
  else
    linux-id
  fi
}

function update-os() {
  local based=$(linux-id-based)
  if [[ "$based" =~ *"debian"* ]]; then
    update-debian-based
  elif [[ "$based" =~ *"fedora"* ]]; then
    update-fedora-based
  elif [[ "$based" =~ *"arch"* ]]; then
    update-arch-based
  else
    error "Not supported update for distro based in $based"
  fi
}

function update-debian-based() {
  echo "Updating debian based linux..."
  sudo apt-get update
  sudo apt-get upgrade --yes
  sudo apt autoremove
}

function update-fedora-based() {
  echo "Updating fedora based linux..."
  sudo dnf upgrade -y
}

function update-fedora-based() {
  echo "Updating arch based linux..."
  sudo pacman -Syu
}
