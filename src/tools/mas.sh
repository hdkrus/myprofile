#!/bin/bash

UPDATE_LIST+=("update-app-store")

function update-app-store() {
  echo-color yellow "Updating App Store..."
  mas upgrade
}
