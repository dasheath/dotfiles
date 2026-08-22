alias rebash=". ~/.bashrc"

# Quickly run update && upgrade && cleanup unused packages
alias up="sudo apt update ; sudo apt upgrade"
alias cleanup="sudo apt autoremove --purge"

# Nix package manager helpers
alias reflake="home-manager switch --flake ~/.config/home-manager"
alias nixgc="nix-collect-garbage -d"

# Using codium as my ide for now
alias code='codium'

# Source other bash configuration files
# This is a simple way to do this bc bash_aliases is sourced by the ubuntu
# default bashrc
IMPORTS_FILE="$HOME/.config/bash/.bash_imports"
if [[ -f "$IMPORTS_FILE" ]]; then
  . "$IMPORTS_FILE"
fi

# Want to run this in background by default
alias vlc="vlc &"

# Rysncp with useful flags
alias rsyncp="rsync -azP"
