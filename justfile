rebuild sys:
    nixos-rebuild switch --sudo --flake .#{{sys}}

up sys: && (rebuild sys)
    nix flake update

gc:
    nix-collect-garbage
