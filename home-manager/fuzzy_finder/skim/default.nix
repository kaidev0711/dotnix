{ config, pkgs, lib, ... }:
{
  programs.skim = {
    enable = true;
    enableFishIntegration = false;
  };
}
