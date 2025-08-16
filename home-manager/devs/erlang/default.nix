{pkgs, ...}: {
  home.packages = with pkgs; [
    beam28Packages.erlang
    beam28Packages.rebar3
  ];
}
