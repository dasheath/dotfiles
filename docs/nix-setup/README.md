
## Update package and ensure curl present
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install curl -y
```

## Run the nix installer
```bash
curl -L https://nixos.org/nix/install | sh -s -- --daemon
```

## Refresh shell to source this
```bash
. /etc/profile.d/nix.sh
```

## Verify
```bash
nix-env --version
```

## Flakes
```bash
sudo mkdir -p /etc/nix
echo "experimental-features = nix-command flakes" | sudo tee -a /etc/nix/nix.conf
```

## Test Nix Install
```bash
nix shell nixpkgs#hello -c hello
```


# Setup Home Config

## Create config directory
```bash
mkdir -p ~/.config/home-manager
cd ~/.config/home-manager
```

## Initialize the flake
```bash
nix flake init -t github:nix-community/home-manager
### This generates flake.nix and home.nix : replace 'yourusername' with my username

# My test, the above way didnt create both home.nix and flake.nix
# Trying the below
nix run github:nix-community/home-manager -- init --switch
```

## Add packages
```
# vi home.nix
home.packages = [
  pkgs.git
  pkgs.htop
  pkgs.tmux
  # search at https://nixos.org
  # https://search.nixos.org/packages

  pkgs.awesome
  pkgs.pyenv
  pkgs.neovim
  pkgs.clang
  pkgs.gnumake
  pkgs.cmake
  pkgs.vlc
  pkgs.xz
  pkgs.llvm

]
```

## Run Initial Activation
```bash
# This must be run from the ~/.config/home-manager dir
nix run github:nix-community/home-manager -- switch --flake .#yourusername

# so for me, and flexible to run from anywhere
nix run github:nix-community/home-manager -- switch --flake ~/.config/home-manager#heath
```

## Manage future updates

- To add new packages ot modify configs, edit ~/.config/home-manager/home.nix
- Apply the changes by running:

home-manager switch --flake ~/.config/home-manager

# Setting Up Dev Shells

## Initialize a Flake in Project
```bash
cd <project directory>
nix flake init
```

## Configure The flake.nix

- See the demo-project-flake-nix.md file located here

## Enter the dev shell
- Nix flakes strictly track files managed by git, must stage the file

```bash
git init # if not done
git add flake.nix
nix develop
```

- For the 'uv' demo flake make sure this is done
```bash
uv init --lib
uv add requests numpy # for example
uv add --dev ruff
```

## Automate using the flake with direnv

```bash
echo "use flake" > .envrc
direnv allow
```
