{ ... }:
{
  programs.atuin = {
    enable = true;
    enableNushellIntegration = true;
    enableFishIntegration = false;
    flags = [ "--disable-up-arrow" ];
    settings = {
      auto_sync = true;
      sync_frequency = "24h";
      style = "compact";
      inline_height = 25;
    };
  };
  catppuccin.atuin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };
}
