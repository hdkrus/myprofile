#!/bin/bash

UPDATE_LIST+=("update-app-store")

function update-app-store() {
  echo "Updating App Store..."
  mas upgrade
}
