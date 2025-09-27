{pkgs, ...}: {
  imports = [
    ./serpl
    ./scooter
  ];
  home.packages = with pkgs; [
    serpl
    scooter
  ];
}
