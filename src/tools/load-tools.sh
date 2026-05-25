#!/bin/bash

function load-tool() {
  local tools=("$@")

  for tool in "${tools[@]}"; do
    source "$(myprofile-tools-path)/${tool}.sh"
  done
}

function load-existing-tools() {
    load-tool "utils"
    
    if command -v brew &> /dev/null; then
        load-tool "brew"
    fi
    
    if command -v flatpak &> /dev/null; then
        load-tool "flatpak"
    fi
    
    if command -v snap &> /dev/null; then
        load-tool "snap"
    fi
    
    if command -v kubectl &> /dev/null; then
        load-tool "k8s"
    fi
}

load-existing-tools
