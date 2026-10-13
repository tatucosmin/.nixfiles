{ pkgs, username, ... }:

{
  networking.hostName = "blck";
  networking.computerName = "blck";

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  # Nix settings (mirrors core/system.nix)
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # auto-optimise-store is problematic on macOS; use scheduled optimisation instead
  nix.optimise.automatic = true;

  nix.gc = {
    automatic = true;
    interval = {
      Weekday = 0;
      Hour = 3;
      Minute = 0;
    }; # weekly, Sunday 03:00
    options = "--delete-older-than 7d";
  };

  time.timeZone = "Europe/Bucharest";

  # User (needed by home-manager and user-level options)
  users.users.${username}.home = "/Users/${username}";
  system.primaryUser = username;

  environment.systemPackages = with pkgs; [
    git
    helix
    wget
    curl
    btop
  ];

  security.pam.services.sudo_local.touchIdAuth = true;

  # homebrew = {
  #   enable = true;
  #   casks = [ "steam" ];
  # };

  system.stateVersion = 6;
}
