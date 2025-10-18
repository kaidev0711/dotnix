{inputs, ...}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {inherit inputs;};
        users.tuandv = {
          imports = [
            ../../../home-manager
            inputs.stylix.homeModules.stylix
          ];
        };
      };
    }
  ];
}
