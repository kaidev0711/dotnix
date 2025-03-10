{ pkgs, ... }:
{
  imports = [
    ./aerospace
  ];
  home.packages = with pkgs; [
    aerospace
    jankyborders
  ];
}
