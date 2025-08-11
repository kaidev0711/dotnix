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
    ./multiplexers
    ./file_manager
    ./music
    ./search_and_replace
    ./spell_checker
    ./themes
    ./llm
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
  home.packages = with pkgs; [];
  programs.nix-index.enable = true;
  programs.home-manager.enable = true;
}
