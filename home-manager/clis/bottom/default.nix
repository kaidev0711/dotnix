{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.bottom = {
    enable = true;
    settings = {
      flags = {
        basic = true;
      };
    };
  };
}
