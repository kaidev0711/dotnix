{pkgs, ...}: {
  home.packages = with pkgs; [
    beam28Packages.erlang
    beam28Packages.elixir
    beam28Packages.elixir-ls
  ];
}
