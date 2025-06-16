{ config, pkgs, ... }:
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
    ./music
  ];
  home.stateVersion = "25.05";
  home.enableNixpkgsReleaseCheck = false;
  # xdg.enable = true;
  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    EDITOR = "hx";
    SHELL = "${pkgs.nushell}/bin/nu";
    # XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
  };
  home.packages = with pkgs; [ ];
  programs.nix-index.enable = true;
  programs.home-manager.enable = true;
  # catppuccin = {
  #   enable = true;
  #   flavor = "mocha";
  # };
}
