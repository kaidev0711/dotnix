{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./scripts
    ./shells
    ./controls
    ./terminals
    ./clis
    ./fuzzy_finder
    ./editors
    ./window_manager
    ./devs
    ./multiplexers
    ./file_manager
  ];
  home.stateVersion = "24.11";
  programs.nix-index.enable = true;
  home.sessionVariables = { };
  home.packages = with pkgs; [ ];
  programs.home-manager.enable = true;
}
