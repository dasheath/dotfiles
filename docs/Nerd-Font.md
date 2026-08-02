# Installing Nerd Fonts

## Method 1 - Nix Package Manager

Add the import to nix flake like:
```nix
pkgs.nerd-fonts.jetbrains-mono
```

If it is not loading properly, a combo of 

```bash
fc-cache -fv
```

and logout, login should sort everything.

## Method 2 - Manual Install

This script was drafted to install jetbrains mono:

```bash
#!/bin/bash

set -eou

# make and enter the fonts dir
mkdir -p ~/.local/share/fonts
pushd ~/.local/share/fonts

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

unzip JetBrainsMono.zip

# Load the font files
fc-cache -fv

popd
```