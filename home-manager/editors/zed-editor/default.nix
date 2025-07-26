{ ... }:
{
  imports = [
    ./userSettings.nix
    ./userKeymaps.nix
    ./userTasks.nix
    ./extensions.nix
    ./installRemoteServer.nix
    ./themes.nix
  ];
  programs.zed-editor = {
    enable = true;
  };
}
