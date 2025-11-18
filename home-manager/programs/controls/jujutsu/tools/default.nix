{pkgs, ...}: {
  imports = [
    ./jjui
  ];
  home.packages = with pkgs; [
    lazyjj
  ];
}
