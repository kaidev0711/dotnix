{pkgs, ...}: {
  imports = [
    ./direnv
    ./just
    ./bacon
  ];
  home.packages = with pkgs; [
    # devenv
    hurl
    ast-grep
    tabiew
    kalker
    pueue
    prek
    hyperfine
    oha
    grex
  ];
}
