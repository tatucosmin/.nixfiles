{
  pkgs,
  inputs,
  config,
  ...
}:
{
  home.packages = with pkgs; [

    prismlauncher
    heroic

    discord
    spotify-player
    spotify

    xclicker
    r2modman

    inputs.helium.packages.${system}.default

  ];

  xdg.configFile."oxwm/config.lua".source =
    config.lib.file.mkOutOfStoreSymlink "/home/cosmin/nixos-config/users/cosmin/configs/oxwm.lua";
}
