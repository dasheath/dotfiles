# Ansible Early System Setup

## Overview

The goal of this playbook is to help with getting a fresh system ready to use. It does this by installing tailscale, unattended upgrades, and setting up the nix home manager.

From there, the rest of the system packages will be covered (as much as possible) with nix package manager, and config will be covered (as much as possible) with dotfiles folders that are symlinked to appropriate places. 
