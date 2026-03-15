{pkgs, ...}: {
  imports = [
    ./helix
    ./fresh_editor
  ];
  home.packages = with pkgs; [
    lldb
  ];
}
