{pkgs, ...}: {
  imports = [
    ./helix
    ./zed-editor
  ];
  home.packages = with pkgs; [
    lldb
  ];
}
