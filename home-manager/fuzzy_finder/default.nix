{ config, pkgs, lib, ... }:
{
  imports = [
    ./television
    ./fzf
    ./skim
  ];
  home.packages = with pkgs; [
    television
  ];
}
