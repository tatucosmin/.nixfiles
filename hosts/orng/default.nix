# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../core/system.nix
    ../../core/oxwm.nix
  ];

  networking.hostName = "orng"; # Define your hostname.
  hardware.bluetooth.enable = true;

  # Configure NVIDIA drivers
  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;
  hardware.nvidia.modesetting.enable = true;

  services.xserver.screenSection = ''
    Option "metamodes" "2560x1440_360 +0+0"
  '';

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05"; # Did you read the comment?

}
