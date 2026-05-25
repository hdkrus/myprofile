#!/bin/bash

UPDATE_LIST+=("update-snap")

function update-snap() {
  echo "Updating snap..."
  sudo snap refresh
}
