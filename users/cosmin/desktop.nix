{ pkgs, ... }:
{
  home.packages = with pkgs; [

    prismlauncher
    heroic

    discord
    spotify

    inputs.helium.packages.${system}.default

  ];
}
