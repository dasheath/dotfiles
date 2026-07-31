#!/bin/bash

# See project README for any required steps before running this script.
#  - SSH Key must be generated & added to github account for ssh cloning.
#  - Otherwise, one could update the REPO_URL variable to the https version
#
# This script expected to be run via a pattern like:
#    bash <(wget -qO- {url to script on githubusercontent.com})
# -------------------------------------------------------------------------

# Set shell options for safety
set -euo pipefail

TARGET_DIRECTORY="$HOME/dotfiles"
REPO_URL="git@github.com:dasheath/dotfiles.git"

ANSIBLE_DIR="$TARGET_DIRECTORY/ansible"
DOTFILES_PRESENT=true

# Authenticate once
if ! sudo -v; then
  echo "❗ User does not have sudo access."
  exit 1
fi
  
# Ansible playbook failing when using newer 'sudo-rs'
# Switch to older C-based implementation
if sudo --version | grep -q sudo-rs; then
    echo "Replacing sudo-rs with standard sudo"
    sudo apt remove -y sudo-rs
    sudo apt install -y sudo
fi

# Ensure we don't clobber an existing dotfiles folder
if [[ -d "$TARGET_DIRECTORY" ]]; then
  echo "⏩ Dotfiles folder already exists. Will skip the git clone!"  
  DOTFILES_PRESENT=true
else 
  echo "✅ Dotfiles folder not found. Proceeding to setup dotfiles!"
  DOTFILES_PRESENT=false
fi

# Start off by installing a few needed packages
echo "🟢 Updating apt cache and adding packages"
sudo apt update &>/dev/null
sudo apt install -y git ansible python3 sudo stow

# Clone the repository to TARGET_DIRECTORY
if [[ ! $DOTFILES_PRESENT ]]; then
  echo "📁 Creating dotfiles folder"
  mkdir $TARGET_DIRECTORY
  pushd $TARGET_DIRECTORY > /dev/null
  git clone "$REPO_URL" "$TARGET_DIRECTORY"
  popd > /dev/null
else
  echo "Dotfiles repo exists. Updating..."
  git -C "$TARGET_DIRECTORY" pull --ff-only
fi

# Run ansible playbook:
#  - Set up nix home manager
#  - Set up tailscale
#  - Enable unattended upgrades
bash "$TARGET_DIRECTORY/run-ansible.sh"

# Stow all the configs using the script in the repo
#  - Stow should be installed via nix home-manager
#  - If the ansible step for setting up and enabling the packages flake
#    does not work or run, this fails gracefully.
bash "$TARGET_DIRECTORY/stow-all.sh"

# Nix package manager home manager setup
bash "$TARGET_DIRECTORY/setup-nix-home-manager.sh"

# Font refresh to use the font installed via nix :)
fc-cache -fv


echo "Log out and log back in to enable everything to refresh properly"
