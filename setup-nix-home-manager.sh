#!/bin/bash

CFG_DIR="$HOME/.config/home-manager"

# Ensure the home-manager config is present
if [[ ! -d "$CFG_DIR" ]]; then
    echo "Config directory not present. This should be done via stow."
    exit 1
fi

nix-env --version
nix run github:nix-community/home-manager -- init --switch

