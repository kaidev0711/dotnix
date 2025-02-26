{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./ssh
    ./git
    ./gh
    ./jujutsu
    ./gitui
  ];
  home.packages = with pkgs; [ ];
}
