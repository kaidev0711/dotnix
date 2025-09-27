{pkgs, ...}: {
  imports = [
    ./ssh
    ./git
    ./gh
    ./jujutsu
    ./gitui
    ./git_cliff
  ];
  home.packages = with pkgs; [];
}
