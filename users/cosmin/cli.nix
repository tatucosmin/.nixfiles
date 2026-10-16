{ pkgs, inputs, lib, ... }:
{

  home.packages = (with pkgs; [
    ripgrep
    fzf
    eza

    just

    fastfetch
    tree
    glow

    codecrafters-cli
    
    zip
    xz
    unzip

  ])
  ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux (with pkgs; [
    maim
    xclip
    inputs.fsel.packages.${system}.default
  ]);
  # Currently no MacOS only pkgs
  # ++ lib.optionals isDarwin (with pkgs; [
  # ]);

}
