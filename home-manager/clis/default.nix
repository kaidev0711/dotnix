{ pkgs, ... }:
{
  imports = [
    ./carapace
    ./starship
    ./zoxide
    ./eza
    ./bat
    ./bottom
    ./jq
    ./ripgrep
    ./fd
    ./tealdeer
    ./macchina
    ./pipes_rs
    ./bacon
    ./presenterm
  ];
  home.packages = with pkgs; [
    wget
    du-dust
    just
    sd
    tokei
    procs
    pipes-rs
    hyperfine
    nix-prefetch-git
    serpl
    presenterm
  ];
}
