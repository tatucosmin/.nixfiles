{
  pkgs,
  inputs,
  config,
  ...
}:
let
  sys = pkgs.stdenv.hostPlatform.system;

  inherit (pkgs.stdenv) isLinux isDarwin
  
  helium = inputs.helium.packages.${sys}.default;
  mocktail = inputs.mocktail.packages.${sys}.default;
in
{
  home.packages = (with pkgs; [

    prismlauncher

    spotify
    discord
    obsidian

    helium
    ])
    ++ lib.optionals isLinux (with pkgs; [
      xclicker

      heroic
      mocktail
    ])
    ++ lib.optionals isDarwin (with pkgs; [
    ]);

  ];

  xdg.configFile."oxwm/config.lua" = lib.mkIf isLinux {
    source = config.lib.file.mkOutOfStoreSymlink "/home/cosmin/nixos-config/users/cosmin/configs/oxwm.lua";
  }
}
