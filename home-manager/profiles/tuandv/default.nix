{config, ...}: {
  imports = [
    ../../programs
  ];
  home.stateVersion = "25.11";
  home.enableNixpkgsReleaseCheck = false;
  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    EDITOR = "hx";
    VISUAL = "hx";
  };
  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/.cargo/bin"
    "${config.home.homeDirectory}/devs/_go/bin"
    "${config.home.homeDirectory}/.krew/bin"
  ];
  xdg.enable = true;
  programs.nix-index.enable = true;
  programs.home-manager.enable = true;
}
