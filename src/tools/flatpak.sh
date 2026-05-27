#!/bin/bash

UPDATE_LIST+=("update-flatpak")

function update-flatpak() {
  echo "Updating flatpak..."
  flatpak update --assumeyes
}
