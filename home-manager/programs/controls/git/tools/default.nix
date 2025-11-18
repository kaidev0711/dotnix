{pkgs, ...}: {
  imports = [
    ./git_cliff
    ./gh
    ./gh_dash
    ./lazygit
    # ./gitui
  ];
  home.packages = with pkgs; [
    serie
    glab
  ];
}
