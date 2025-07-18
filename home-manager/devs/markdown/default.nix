{ pkgs, ... }:
{
  imports = [
    ./markdown_oxide
    ./marksman
  ];
  home.packages = with pkgs; [
    marksman
    markdown-oxide
  ];
}
