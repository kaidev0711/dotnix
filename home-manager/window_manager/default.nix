{ config, pkgs, lib, ... }:
{
  imports = [
    ./aerospace
  ];
  home.packages = with pkgs; [
    aerospace
  ];
}
