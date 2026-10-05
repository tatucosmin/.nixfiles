{ pkgs, inputs, ... }:
{

  imports = [inputs.otter-launcher.homeModules.default];
  
  home.packages = with pkgs; [
    ripgrep
    fzf
    eza

    just

    fastfetch
    tree

    codecrafters-cli
    
    zip
    xz
    unzip

    inputs.fsel.packages.${system}.default
  ];

  programs.otter-launcher = {
    enable = true;
  };
}
