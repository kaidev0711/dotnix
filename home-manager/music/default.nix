{ pkgs, ... }:
{
  imports = [
    ./spicetify
  ];
  home.packages = with pkgs; [
    spicetify-cli
  ];
}
