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
  home.file.".hushlogin".text = "";
  programs.nix-index.enable = true;
  xdg.enable = true;
  home.sessionVariables = {
    EDITOR = "hx";
    SHELL = "${pkgs.fish}/bin/fish";
    # TMPDIR = "/tmp";
  };
  home.packages = with pkgs; [ ];
  programs.home-manager.enable = true;
}
