{ pkgs, ... }:
{
  imports = [
    ./fish
    ./nushell
  ];

  home.packages = with pkgs; [
    nufmt
  ];
}
