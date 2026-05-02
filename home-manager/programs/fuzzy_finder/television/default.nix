{...}: {
  imports = [
    ./settings.nix
    ./channels.nix
  ];
  programs.television = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = false;
  };
}
