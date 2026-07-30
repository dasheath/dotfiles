{ pkgs, ... }: 

{
  fonts.packages = with pkgs; [
    # Modern nixpkgs syntax
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code

    # Legacy nixpkgs syntax (NixOS 24.11 or older)
    # (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })
  ];
}
