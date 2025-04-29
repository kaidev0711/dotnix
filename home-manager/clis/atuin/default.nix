{ ... }:
{
  programs.atuin = {
    enable = true;
    enableNushellIntegration = true;
    enableFishIntegration = false;
    flags = [ "--disable-up-arrow" ];
    settings = {
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
