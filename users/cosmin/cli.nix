{ pkgs, inputs, ... }:
{

  imports = [inputs.otter-launcher.homeModules.default];
  
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
  ++ lib.optionals lib.isLinux (with pkgs; [
    maim
    xclip
    inputs.fsel.packages.${system}.default
  ])
  # Currently no MacOS only pkgs
  # ++ lib.optionals isDarwin (with pkgs; [
  # ]);

}
