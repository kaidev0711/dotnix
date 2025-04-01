{ pkgs, ... }:
{
  imports = [
    ./direnv
    ./rust
    ./swift
    ./markdown
    ./web
  ];
  home.packages = with pkgs; [
    # devenv
    hurl
    harper
  ];
}
