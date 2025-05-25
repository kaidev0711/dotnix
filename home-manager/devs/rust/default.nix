{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer
    rustlings
    cargo-nextest
    cargo-audit
    cargo-flamegraph
    cargo-binstall
    cargo-info
    gitoxide
    openssl
    pkg-config
  ];
}
