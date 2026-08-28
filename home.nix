{ config, pkgs, ... }:

{
  home.username = "cosmin";
  home.homeDirectory = "/home/cosmin";

  home.packages = with pkgs; [

    # editor
    helix

    # lang
    zig

    nil

    # utils
    ripgrep
    eza
    fzf

    # archives
    zip
    xz
    unzip

    # games
    prismlauncher
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Tatu Cosmin";
      user.email = "ctatudev@gmail.com";
      init.defaultBranch = "main";
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
