{ pkgs, ... }:
{
  imports = [
    ./direnv
    ./rust
    ./swift
    ./markdown
    ./web
    ./typst
  ];
  home.packages = with pkgs; [
    # devenv
    hurl
    harper
  ];
}
