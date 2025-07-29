{ pkgs, ... }:
{
  home.packages = with pkgs; [
    postgres-lsp
  ];
}
