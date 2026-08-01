{ pkgs, ... }:

{
programs.tmux = {
  enable = true;
  shortcut = "a"; # Sets the prefix shortcut to ctrl-a
  keyMode="vi"; # Enable vi-style keys to copy/move

  # Inject pure custom configs here
  extraConfig = ''
    set -g mouse on
  '';

  # Managing plugins
  plugins = with pkgs.tmuxPlugins;  [ 
    sensible 
    nord 
  ];
};
}
