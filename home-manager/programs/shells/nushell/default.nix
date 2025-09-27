{...}: {
  imports = [
    ./extraConfig.nix
    ./extraEnv.nix
    ./shellAliases.nix
    ./plugins.nix
  ];
  programs.nushell = {
    enable = true;
  };
}
