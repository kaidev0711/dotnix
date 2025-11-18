{...}: {
  programs.lazygit = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    shellWrapperName = "lzg";
    settings = {};
  };
}
