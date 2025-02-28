{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.bacon = {
    enable = true;
    settings = { };
  };
}
