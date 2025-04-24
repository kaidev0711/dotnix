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
    ./fastfetch
    ./pipes_rs
    ./bacon
    ./presenterm
    ./glow
    ./atuin
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
    glow
    hexyl
    kondo
    ouch
  ];
}
