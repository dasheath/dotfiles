#!/bin/bash

set -euo pipefail

if ! command -v stow > /dev/null ; then
  echo "Stow not installed. Install stow and try again."
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
CONFIGS_DIR="${SCRIPT_DIR}/configs"

if [[ ! -d "$CONFIGS_DIR" ]]; then
  echo "❗ Configs directory not present. Exiting."
  exit 1
fi

pushd "$CONFIGS_DIR" > /dev/null

# Stow the packages managed here
if [[ -f "$HOME/.gitconfig" ]] && [[ ! -L "$HOME/.gitconfig" ]]; then
  echo "Backing up existing .gitconfig to .gitconfig.bak"
  mv "$HOME/.gitconfig" "$HOME/.gitconfig.bak"
fi
stow -t ~ git

stow -t ~ bash
stow -t ~ vim
stow -t ~ nvim
stow -t ~ tmux
stow -t ~ nix-home-manager

popd > /dev/null
