#!/bin/bash

function load-tool() {
  local tools=("$@")

  for tool in "${tools[@]}"; do
    source "$(myprofile-tools-path)/${tool}.sh"
  done
}

function load-tool-if-exists() {
    local tool="@1"
    
    if command -v "$tool" &> /dev/null; then
        load-tool "$tool"
    fi
}

function load-existing-tools() {
    load-tool "utils"
    
    load-tool-if-exists brew
    load-tool-if-exists flatpak
    load-tool-if-exists snap
    load-tool-if-exists k8s
}

load-existing-tools
