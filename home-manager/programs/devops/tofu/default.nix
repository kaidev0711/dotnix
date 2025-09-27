{pkgs, ...}: {
  home.packages = with pkgs; [
    opentofu
    tofu-ls
  ];
}
