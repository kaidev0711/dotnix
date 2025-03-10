{ pkgs, ... }:
{
  imports = [
    ./aerospace
  ];
  home.packages = with pkgs; [
    ice-bar
    aerospace
    jankyborders
  ];
}
