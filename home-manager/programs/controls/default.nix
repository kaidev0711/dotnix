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
    ./delta
  ];
  home.packages = with pkgs; [
    lazyjj
    sshx
  ];
}
