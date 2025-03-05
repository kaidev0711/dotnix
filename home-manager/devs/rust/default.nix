{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # rustc
    # cargo
    # rustfmt
    # clippy
    # rust-analyzer
    # cargo-watch
    # openssl
    # pkg-config
  ];
}
