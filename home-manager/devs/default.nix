{pkgs, ...}: {
  imports = [
    ./direnv
    ./nix
    ./rust
    ./gleam
    ./go
    ./toml
    ./swift
    ./markdown
    ./web
    ./typst
    ./erlang
    ./elixir
    ./sql
    ./just
  ];
  home.packages = with pkgs; [
    # devenv
    hurl
    ast-grep
    tabiew
    kalker
  ];
}
