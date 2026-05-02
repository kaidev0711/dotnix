{pkgs, ...}: {
  imports = [
    ./scooter
  ];
  home.packages = with pkgs; [
    scooter
  ];
}
