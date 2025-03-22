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
    ./browsers
    ./chat
  ];
  home.stateVersion = "24.11";
  programs.nix-index.enable = true;
  xdg.enable = true;
  home.sessionVariables = {
    EDITOR = "hx";
    SHELL = "${pkgs.fish}/bin/fish";
  };
  home.packages = with pkgs; [ ];
  programs.home-manager.enable = true;
}
