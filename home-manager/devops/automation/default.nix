{pkgs, ...}: {
  home.packages = with pkgs; [
    ansible
    wrkflw
  ];
}
