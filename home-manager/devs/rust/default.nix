{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # rustc
    # cargo
    # rustfmt
    # clippy
    # rust-analyzer
    # openssl

    # TOOLCHAINS
    # rustup
  ];
}
