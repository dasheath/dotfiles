{ config, pkgs, ... }:

{
  imports = [
    ./modules/packages.nix
    ./modules/tmux.nix
  ];
  home.username = "heath";
  home.homeDirectory = "/home/heath";
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = { };

  home.sessionVariables = { };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
