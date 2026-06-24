#!/bin/bash

UPDATE_LIST+=("update-flatpak")

function update-flatpak() {
  echo-color yellow "Updating flatpak..."
  sudo flatpak update --assumeyes
}
