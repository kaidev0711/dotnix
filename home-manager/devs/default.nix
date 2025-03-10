{ pkgs, ... }:
{
  imports = [
    ./direnv
    ./rust
    ./markdown
    ./web
  ];
  home.packages = with pkgs; [
    # devenv
  ];
}
