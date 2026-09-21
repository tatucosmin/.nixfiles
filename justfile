rebuild:
    nixos-rebuild switch --flake .

up: && rebuild
    nix flake update

gc:
    nix-collect-garbage
