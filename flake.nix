{
  description = "Mbtuandv nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    zjstatus = {
      url = "github:dj95/zjstatus";
    };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
      zjstatus,
      ...
    }:
    let
      overlays = with inputs; [
        (final: prev: { zjstatus = zjstatus.packages.${prev.system}.default; })
      ];
    in
    {
      # darwin-rebuild build --flake .#mbtuandv
      darwinConfigurations."mbtuandv" = nix-darwin.lib.darwinSystem {
        modules = [
          ./hosts/mbtuandv/configuration.nix
          home-manager.darwinModules.home-manager
          {
            nixpkgs.overlays = overlays;
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
