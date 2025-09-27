{...}: {
  imports = [
    ./shellInit.nix
    ./functions.nix
    ./plugins.nix
    ./shellAliases.nix
    ./shellAbbrs.nix
  ];
  programs.fish = {
    enable = true;
  };
}
