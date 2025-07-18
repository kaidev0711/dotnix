{ pkgs, ... }:
{
  imports = [
    ./direnv
    ./rust
    ./swift
    ./markdown
    ./web
    ./typst
    ./elixir
    ./sql
  ];
  home.packages = with pkgs; [
    # devenv
    hurl
    harper
    ast-grep
    tabiew
    kalker
    taplo
    codebook
    nixd
    nixfmt-rfc-style
  ];
}
