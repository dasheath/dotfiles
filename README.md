# Dotfiles System Management

## Overview

The aim is to manage ubuntu system config and packges. Packages are primarily managed via nix home-manager. Configs are managed through dotfiles folders here, which will be stowed using the stow command. 

There will be an initial step needed to get a fresh OS install ready to use any of this.
This will be managed via an initial setup script which installs a couple ubuntu system packages needed to get started including git, and curl, clone this repository, and setup some system packages via ansible that cannot properly be managed by home-manager on ubuntu.

## Doing Initial Setup

1. Create an ssh key via & add to ssh agent

```bash
ssh-keygen -t ed25519 -C "your.email@website.com

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

2. Then go add this SSH key to your github account.

3. Run the initial-setup.sh script:

```bash
wget -qO /tmp/dotfiles-installer.sh https://raw.githubusercontent.com/dasheath/dotfiles/refs/heads/main/initial-setup.sh
bash /tmp/dotfiles-installer.sh
```

