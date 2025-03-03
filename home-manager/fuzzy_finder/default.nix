{ pkgs, ... }:
{
  imports = [
    ./television
    ./fzf
    ./skim
  ];
  home.packages = with pkgs; [
    television
  ];
}
