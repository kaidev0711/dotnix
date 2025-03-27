{ ... }:
{
  programs.atuin = {
    enable = true;
    enableNushellIntegration = true;
    enableFishIntegration = false;
    flags = [ "--disable-up-arrow" ];
    settings = {
      style = "full";
      inline_height = 20;
    };
    daemon = { };
  };
}
