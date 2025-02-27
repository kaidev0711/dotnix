{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.gh = {
    enable = true;
    settings = {
      editor = "hx";
      git_protocol = "ssh";
    };
  };
}
