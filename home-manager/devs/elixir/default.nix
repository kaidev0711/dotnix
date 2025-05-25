{ pkgs, ... }:
{
  home.packages = with pkgs; [
    beam27Packages.erlang
    beam27Packages.elixir
    beam27Packages.elixir-ls
    nodejs_24
    postgresql
  ];
}
