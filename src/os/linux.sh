#!/bin/bash

source "$(myprofile-os-path)/.unix_based.sh"

# clipboard commands
alias pbcopy='xclip -selection clipboard'

alias pbpaste='xclip -selection clipboard -o'

function linux-release() {
  cat /etc/os-release
}

function linux-id() {
  local id_line=$(linux-release | \grep ^ID=)

  if [[ "$id_line" =~ ^ID=\"?([^\"]+)\"? ]] || [[ "$id_line" =~ ^ID=\'?([^\']+)\'? ]]; then
    if [[ "$(is-zsh)" == "yes" ]]; then
        echo "$match[1]"
    elif [[ "$(is-bash)" == "yes" ]]; then
        echo "${BASH_REMATCH[1]}"
    fi
  else
    echo "<Unknown>"
  fi
}

function linux-id-based() {
  local like=$(linux-release | \grep ^ID_LIKE=)

  if [[ "$like" =~ ^ID_LIKE=\"?([^\"]+)\"? ]] || [[ "$like" =~ ^ID_LIKE=\'?([^\']+)\'? ]]; then
    if [[ "$(is-zsh)" == "yes" ]]; then
        echo "$match[1]"
    elif [[ "$(is-bash)" == "yes" ]]; then
        echo "${BASH_REMATCH[1]}"
    fi
  else
    linux-id
  fi
}

function update-os() {
  local based=$(linux-id-based)
  if [[ "$based" = *"debian"* ]]; then
    update-debian-based
  elif [[ "$based" = *"fedora"* ]]; then
    update-fedora-based
  elif [[ "$based" = *"arch"* ]]; then
    update-arch-based
  elif [[ "$based" = *"opensuse"* ]]; then
    update-opensuse
  elif [[ "$based" = *"gentoo"* ]]; then
    update-gentoo-based
  else
    error "Not supported update for distro based in $based"
  fi
}

function update-debian-based() {
  echo "Updating Debian based linux..."
  sudo apt-get update
  sudo apt-get upgrade --yes
  sudo apt autoremove
}

function update-fedora-based() {
  echo "Updating Fedora based linux..."
  sudo dnf upgrade --assumeyes
}

function update-arch-based() {
  echo "Updating Arch based linux..."
  sudo pacman -Syu --noconfirm
}

function update-opensuse() {
  echo "Updating openSUSE linux..."
  sudo zypper --non-interactive refresh
  sudo zypper --non-interactive dup
}

function update-gentoo-based() {
  echo "Updating Gentoo based linux..."
  sudo emerge --update --deep --newuse --changed-deps @world
}
