{pkgs, ...}: {
  imports = [
    ./helix
  ];
  home.packages = with pkgs; [
    lldb
  ];
}
