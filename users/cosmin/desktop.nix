{
  pkgs,
  inputs,
  config,
  ...
}:
let
  sys = pkgs.stdenv.hostPlatform.system;

  helium = inputs.helium.packages.${sys}.default;
  mocktail = inputs.mocktail.packages.${sys}.default;
in
{
  home.packages = with pkgs; [

    prismlauncher
    heroic

    discord
    spotify-player
    spotify

    xclicker
    r2modman
    maim

    obsidian

    helium
    mocktail

  ];

  xdg.configFile."oxwm/config.lua".source =
    config.lib.file.mkOutOfStoreSymlink "/home/cosmin/nixos-config/users/cosmin/configs/oxwm.lua";
}
