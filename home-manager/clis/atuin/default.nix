{ ... }:
{
  programs.atuin = {
    enable = true;
    enableNushellIntegration = true;
    enableFishIntegration = false;
    flags = [ "--disable-up-arrow" ];
    settings = {
      style = "full";
    };
    daemon = { };
  };
}
