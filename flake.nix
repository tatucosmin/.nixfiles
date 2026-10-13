{
  description = "cxmin's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helium = {
      url = "github:schembriaiden/helium-browser-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fsel = {
      url = "github:Mjoyufull/fsel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mocktail = {
      url = "github:komaruworld/mocktail";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      ...
    }@inputs:
    let
      username = "cosmin";
    in
    {
      nixosConfigurations = {
        orng = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs username; };
          modules = [
            ./hosts/orng/default.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit inputs username; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";

              home-manager.users.${username} = import ./users/${username};
            }
          ];
        };
      };
      darwinConfigurations = {
        blck = nix-darwin.lib.darwinSystem {
          specialArgs = { inherit inputs username; };
          modules = [
            ./hosts/blck/default.nix
            
            home-manager.darwinModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit inputs username; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";

              home-manager.users.${username} = import ./users/${username};
            }
          ];
        };
      };
    };
}
