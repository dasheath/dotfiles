# Update the home manager flake like so

```
# 1. Accept the argument here
{ config, pkgs, nixpkgs-pinned, ... }:


let
  # 2. Instantiate the package set using your main system profile type
  pkgs-pinned = import nixpkgs-pinned {
    inherit (pkgs) system;
    config.allowUnfree = true; # Carry over unfree flags if needed
  };
in
{
  home.username = "yourusername";
  home.homeDirectory = "/home/yourusername";
  home.stateVersion = "24.11";

  home.packages = [
    pkgs.git  # Normal, rolling-release package
    pkgs.htop

    # 3. Reference the pinned package subset instead of regular 'pkgs'
    pkgs-pinned.pnpm  
  ];
}
```