#!/bin/bash

set -eou

# make and enter the fonts dir
mkdir -p ~/.local/share/fonts
pushd ~/.local/share/fonts

if [[ ! -f "JetBrainsMono.zip" ]]; then
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv

else
  echo "JetBrainsMono.zip already present. Skipping download."
fi
