#!/bin/bash

set -euo pipefail

if ! command -v stow ; then
  echo "Stow not installed. Install stow and try again."
  exit 1
fi

# Stow the packages managed here
pushd configs >/dev/null

stow -t ~ git


popd
