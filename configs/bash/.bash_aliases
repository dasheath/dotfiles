alias rebash=". ~/.bashrc"
alias reflake="home-manager switch --flake ~/.config/home-manager"

# Source other bash configuration files
# This is a simple way to do this bc bash_aliases is sourced by the ubuntu
# default bashrc
if [[ -f ~/.bash_imports ]]; then
  . ~/.bash_imports
fi

# Want to run this in background by default
alias vlc="vlv &"

# quickly run update && upgrade && cleanup unused packages
alias up="sudo apt update ; sudo apt upgrade"
alias cleanup="sudo apt autoremove --purge"

# Rysncp with useful flags
alias rsyncp="rsync -azP"
