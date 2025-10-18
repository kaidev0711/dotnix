{pkgs, ...}: {
  imports = [
    ./ssh
    ./git
    ./gh
    ./gh_dash
    ./jujutsu
    # ./gitui
    ./lazygit
    ./git_cliff
  ];
  home.packages = with pkgs; [];
}
