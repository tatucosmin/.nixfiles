{ pkgs, inputs, ... }:

{
  home.username = "cosmin";
  home.homeDirectory = "/home/cosmin";

  home.packages = with pkgs; [

    # editor
    helix
    # vscodium-fhs
    vscode-fhs

    # lang
    zig
    clang-tools

    nil

    # utils
    ripgrep
    eza
    fzf
    just
    lldb

    # everyday
    discord
    spotify

    # archives
    zip
    xz
    unzip

    # games
    prismlauncher
    heroic
    steam

    # browsers
    inputs.helium.packages.${system}.default
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Tatu Cosmin";
      user.email = "ctatudev@gmail.com";
      init.defaultBranch = "main";
    };
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "github_dark";
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
