{pkgs, ...}: {
  imports = [
    ./brave
  ];
  home.packages = with pkgs; [
    # servo
  ];
}
