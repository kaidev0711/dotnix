{pkgs, ...}: {
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
    ./devops
    ./multiplexers
    ./file_manager
    ./music
    ./search_and_replace
    ./spell_checker
    ./themes
    ./browsers
  ];
  home.stateVersion = "25.11";
  home.enableNixpkgsReleaseCheck = false;
  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    EDITOR = "hx";
    SHELL = "${pkgs.nushell}/bin/nu";
  };
  programs.nix-index.enable = true;
  programs.home-manager.enable = true;
}
