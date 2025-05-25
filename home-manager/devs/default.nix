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
  ];
  home.packages = with pkgs; [
    # devenv
    hurl
    harper
  ];
}
