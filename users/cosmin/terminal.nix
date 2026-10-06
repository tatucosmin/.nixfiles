{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.bigblue-terminal
    nerd-fonts.googlesanscode
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "GoogleSansCode Nerd Font";
        size = 12;
      };
    };
  };

  programs.tmux = {
    enable = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;

    initExtra = ''
      PS1='\[\e[32m\]\u@\h:\w\$ \[\e[0m\]'
    '';
  };
}
