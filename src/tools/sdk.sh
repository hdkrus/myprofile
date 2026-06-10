#!/bin/bash

UPDATE_LIST+=("update-sdk")

function update-sdk() {
  echo-color yellow "Updating sdk..."
  sdk update

  local data=$(sdk current | tail -n +2 | awk '{print $1 "," $2 }')
  while IFS=',' read -r package version; do
    # Skip empty lines if any
    [[ -z "$package" ]] && continue

    echo "n" | sdk upgrade "$package" < /dev/null
  done <<< "$data"
}
