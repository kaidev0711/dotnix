{...}: {
  programs.atuin = {
    enable = false;
    enableNushellIntegration = false;
    enableFishIntegration = false;
    flags = ["--disable-up-arrow"];
    settings = {
      auto_sync = true;
      sync_frequency = "24h";
      style = "compact";
      inline_height = 25;
    };
  };
}
