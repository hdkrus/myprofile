#!/bin/bash

alias k="kubectl"
alias kn="kubens"
alias kx="kubectx"

function kcfg() {
  local file=${1}
  shift
  kubectl --config $file ${@}
}
