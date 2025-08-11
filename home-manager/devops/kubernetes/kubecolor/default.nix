{
  pkgs,
  lib,
  ...
}: {
  programs.kubecolor = {
    enable = true;
    enableAlias = true;
    settings = {
      kubectl = lib.getExe pkgs.kubectl;
      preset = lib.mkForce "dark";
      paging = "auto";
    };
  };
}
