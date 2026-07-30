{ config, pkgs, ... }:

{
  # Config managed elsewhere. This makes the packages available.
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  }
}

