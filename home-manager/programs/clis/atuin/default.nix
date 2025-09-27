{...}: {
  programs.atuin = {
    enable = false;
    enableNushellIntegration = false;
    enableFishIntegration = false;
    flags = ["--disable-up-arrow"];
    settings = {
      style = "compact";
      inline_height = 25;
    };
  };
}
