{ pkgs, inputs, ... }:

{

  home.username = "cosmin";
  home.homeDirectory = "/home/cosmin";

  home.packages = with pkgs; [

    # editor
    helix
    zed-editor

    # lang
    zig

    # C++
    libcxx
    clang-tools
    clang
    llvm

    # compilers
    nil

    # utils
    ripgrep
    eza
    fzf
    just
    lldb
    fastfetch
    tree

    # Gnome
    nautilus
    seahorse

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

    inputs.fsel.packages.${system}.default
    # browsers
    inputs.helium.packages.${system}.default
    firefox
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
      theme = "tokyonight";
    };
  };

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "TokyoNight Night";
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
