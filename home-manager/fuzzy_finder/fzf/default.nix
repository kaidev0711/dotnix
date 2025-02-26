{ config, pkgs, lib, ... }:
{
  programs.fzf = {
    enable = true;
    enableFishIntegration = false;
  };
}
