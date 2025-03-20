{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rustup
    rustlings
    cargo-nextest
    cargo-audit
    cargo-flamegraph
    # openssl
    # pkg-config
  ];
}
