{ pkgs, ... }:

{
  home.packages = with pkgs; [
    xclip
    stow
    curl
    gnumake
    
    # Yeah
    neovim
    
    # Font
    nerd-fonts.jetbrains-mono

    # Modern system packages
    # https://github.com/ibraheemdev/modern-unix
    ripgrep 
    fd     # like find
    eza    # like ls
    dust   # like du
    duf    # like df
    choose # like cut
    procs  # like ps

    # TUIs for stuff
    lazygit     # git ui
    lazydocker  # docker ui

    # ghostty with a wrapper to add nixGL for graphics
    # This is required for ghostty to run properly
    (writeShellScriptBin "ghostty" ''
      exec nixGL ${ghostty}/bin/ghostty "$@"
    '')

    # Custom prompt
    # Config managed through dotfiles config dir
    starship
  ];
}

