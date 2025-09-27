{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      cascadia-code
      jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.geist-mono
      nerd-fonts.hack
    ];
  };
}
