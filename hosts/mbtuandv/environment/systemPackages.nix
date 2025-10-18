{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # kanata
    kanata-with-cmd
  ];
}
