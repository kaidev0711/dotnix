{ pkgs, ... }:
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
    ./music
  ];
  home.stateVersion = "24.11";
  xdg.enable = true;
  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    EDITOR = "hx";
    SHELL = "${pkgs.fish}/bin/fish";
  };
  home.packages = with pkgs; [ ];
  programs.nix-index.enable = true;
  programs.home-manager.enable = true;
}
