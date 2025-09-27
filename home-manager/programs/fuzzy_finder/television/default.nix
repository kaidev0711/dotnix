{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./settings.nix
    ./channels.nix
  ];
  programs.television = {
    enable = true;
    package = inputs.television.packages."${pkgs.system}".default;
    enableFishIntegration = true;
  };
}
