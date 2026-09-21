{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    fzf
    eza

    just

    fastfetch
    tree

    zip
    xz
    unzip

    inputs.fsel.packages.${system}.default
  ];
}
