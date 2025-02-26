{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Dang Van Tuan";
        eamil = "kaiz.developers@gmail.com";
      };
    };
  };
}
