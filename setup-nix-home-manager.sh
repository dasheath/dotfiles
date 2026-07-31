#!/bin/bash

CFG_DIR="$HOME/.config/home-manager"

# Ensure the home-manager config is present
if [[ ! -d "$CFG_DIR" ]]; then
    echo "Config directory not present. This should be done via stow."
    exit 1
fi

# Check version of nix-env
nix-env --version

# One-time setup for home-manager
nix run github:nix-community/home-manager -- init --switch

