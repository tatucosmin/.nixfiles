rebuild sys:
    nixos-rebuild switch --sudo --flake .#{{sys}}

up sys: && (rebuild sys)
    sudo nix flake update

gc:
    nix-collect-garbage
