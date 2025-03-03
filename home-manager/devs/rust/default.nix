{ pkgs, ... }:
{
  home.packages = with pkgs; [
    openssl
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer
  ];
}
