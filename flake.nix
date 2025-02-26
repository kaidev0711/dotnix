{
  description = "Mbtuandv nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
    }:
    {
      # darwin-rebuild build --flake .#mbtuandv
      darwinConfigurations."mbtuandv" = nix-darwin.lib.darwinSystem {
        modules = [
          ./hosts/mbtuandv/configuration.nix
          home-manager.darwinModules.home-manager
          {
            # home-manager.backupFileExtension = "backup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.tuandv = {
              imports = [
                ./hosts/mbtuandv/home.nix
              ];
            };
          }
        ];
      };
    };
}
