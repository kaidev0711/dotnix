{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./yazi
    ./broot
  ];
  home.packages = with pkgs; [
  ];
}
