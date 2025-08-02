{pkgs, ...}: {
  imports = [
    ./direnv
    ./nix
    ./rust
    ./toml
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
    ast-grep
    tabiew
    kalker
  ];
}
