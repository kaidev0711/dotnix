{pkgs, ...}: {
  home.packages = with pkgs; [
    beam28Packages.elixir
    beam28Packages.elixir-ls
  ];
}
