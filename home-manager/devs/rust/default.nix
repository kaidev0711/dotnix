{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rustup
    # openssl
    # pkg-config
  ];
}
