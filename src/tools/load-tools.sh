#!/bin/bash

function load-tool() {
  local tools=("$@")

  for tool in "${tools[@]}"; do
    source "$(myprofile-tools-path)/${tool}.sh"
  done
}

load-tool "utils"

if [[ "$(is-macos)" == "yes" ]]; then
  load-tool "brew"
fi
