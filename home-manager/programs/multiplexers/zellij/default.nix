{pkgs, ...}: let
  roomPlugin = pkgs.fetchurl {
    url = "https://github.com/rvcas/room/releases/latest/download/room.wasm";
    sha256 = "sha256-t6GPP7OOztf6XtBgzhLF+edUU294twnu0y5uufXwrkw=";
  };
  grabPlugin = pkgs.fetchurl {
    url = "https://github.com/imsnif/grab/releases/latest/download/grab.wasm";
    sha256 = "sha256-ht7yiHfmgZm2gv4/6R622M2G8rrC5lq7RmXoZDc5Kco=";
  };
in {
  xdg.configFile = {
    "zellij/plugins/room.wasm".source = roomPlugin;
    "zellij/plugins/grab.wasm".source = grabPlugin;
  };
  imports = [
    ./settings.nix
    ./extraConfig.nix
    ./layouts/rust.nix
    ./layouts/vibes.nix
  ];
  programs.zellij = {
    enable = true;
    enableFishIntegration = false;
    attachExistingSession = false;
    exitShellOnExit = false;
  };
}
