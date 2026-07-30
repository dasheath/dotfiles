#!/bin/bash

# See project README for any required steps before running this script.
#  - SSH Key must be generated & added to github account for ssh cloning.
#  - Otherwise, one could update the REPO_URL variable to the https version
#
# This script expected to be run via a pattern like:
#    wget <url_to_this_script_raw> | bash
# -------------------------------------------------------------------------

# Set shell options for safety
set -euo pipefail

TARGET_DIRECTORY="$HOME/dotfiles"
REPO_URL="git@github.com:dasheath/dotfiles.git"

# Make sure the user is in sudoer group
in_sudo=0
for curgroup in $(groups); do
  if [[ $curgroup == "sudo" ]]; then
    in_sudo=1
  fi
done

if [[ ! $in_sudo ]]; then
  echo "Not sudo! Add user to sudo with:"
  echo "\tsudo usermod -aG sudo $USER"
  exit 1 
fi
  
# Ensure we don't clobber an existing dotfiles folder
if [[ -d "$TARGET_DIRECTORY" ]]; then
  echo "Dotfiles folder already exists. Exiting to avoid overwriting!"  
  exit 1
else 
  echo "Dotfiles folder not found. Proceeding to setup dotfiles!"
fi

# Start off by installing a few needed packages
echo "Updating apt cache and adding packages"
sudo apt update &>/dev/null
sudo apt install -y git ansible python3

# Clone the repository to ~/dotfiles
echo "Creating dotfiles folder"
mkdir ~/dotfiles
pushd ~/dotfiles >/dev/null
git clone "$REPO_URL" .
popd >/dev/null

# Use ansible playbook to do the following:
#  - Set up nix home manager
#  - Set up tailscale
#  - Enable unattended upgrades
pushd "$TARGET_DIRECTORY/ansible" >/dev/null
pwd
echo "Skipping the ansible work"
# ansible-playbook site.yml --ask-become-pass
popd >/dev/null


# Stow all the configs using the script in the repo
pushd "$TARGET_DIRECTORY" >/dev/null
bash stow-all.sh
popd >/dev/null

