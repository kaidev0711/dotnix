{ config, pkgs, lib, ... }:
{
  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    git = false;
    colors = "auto";
    icons = "auto";
    extraOptions = [
      "--group-directories-last"
    ];
  };
}
