#!/bin/bash

function load-tool() {
  local tools=${@}

  for tool in "${tools[@]}"; do
    . "$TOOLS_DIR/${tool}.sh"
  done
}

load-tool "utils"

if [[ "$(is-mac)" == "yes" ]]; then
  load-tool "brew"
fi
