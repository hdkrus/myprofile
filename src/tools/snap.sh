#!/bin/bash

UPDATE_LIST+=("update-snap")

function update-snap() {
  echo-color yellow "Updating snap..."
  sudo snap refresh
}
