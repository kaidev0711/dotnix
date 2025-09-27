{pkgs, ...}: {
  home.packages = with pkgs; [
    cilium-cli
    cmctl
    mutagen
    mutagen-compose
  ];
}
