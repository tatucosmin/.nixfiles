{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.bigblue-terminal
    nerd-fonts.googlesanscode

    xclip
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
    terminal = "tmux-256color";
    mouse = true;
    prefix = "C-a";
    extraConfig = ''
      set -ga terminal-overrides ",*:RGB"
      set -g mouse on
      set -g set-clipboard on

      unbind %
      unbind '"'
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      black="#0f0f0f"
      orange="#ef934d"

      set -g status "on"
      set -g status-bg "''${orange}"
      set -g status-justify "left"
      set -g status-left-length "100"
      set -g status-right-length "100"
    '';
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;

    initExtra = ''
      PS1='\[\e[38;2;239;147;77m\]\u@\h:\w\$ \[\e[0m\]'
    '';
  };
}
