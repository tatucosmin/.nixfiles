{ username, ... }:
{

  imports = [
    ./desktop.nix
    ./git.nix
    ./dev.nix
    ./terminal.nix
    ./cli.nix
    ./editors.nix
  ];

  home.username = username;
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${username}" else "/home/${username}";

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

}
