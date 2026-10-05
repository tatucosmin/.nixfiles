{

  imports = [
    ./desktop.nix
    ./git.nix
    ./dev.nix
    ./terminal.nix
    ./cli.nix
    ./editors.nix
  ];

  home.username = "cosmin";
  home.homeDirectory = "/home/cosmin";

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

}
