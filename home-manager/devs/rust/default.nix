{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rustup
    rustlings
    # openssl
    # pkg-config
  ];
}
