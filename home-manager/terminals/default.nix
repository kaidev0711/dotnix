{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./ghostty
    ./alacritty
  ];
}
