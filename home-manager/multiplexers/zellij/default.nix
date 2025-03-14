{ pkgs, ... }:
let
  roomPlugin = pkgs.fetchurl {
    url = "https://github.com/rvcas/room/releases/latest/download/room.wasm";
    sha256 = "sha256-t6GPP7OOztf6XtBgzhLF+edUU294twnu0y5uufXwrkw=";
  };
in
{
  programs.zellij = {
    enable = true;
    enableFishIntegration = false;
  };
  xdg.configFile."zellij/config.kdl".source = ./config.kdl;
  # xdg.configFile."zellij/layouts".source = ./layouts;
  xdg.configFile."zellij/plugins/room.wasm".source = roomPlugin;
}
