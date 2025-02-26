{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.bat = {
    enable = true;
    config = {
      theme = "Kanagawa";
      italic-text = "always";
    };
    themes = {
      Kanagawa = {
        src = ./themes;
        file = "Kanagawa.tmTheme";
      };
    };
  };
}
