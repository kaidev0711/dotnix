{ ... }:
{
  programs.atuin = {
    enable = true;
    enableNushellIntegration = true;
    enableFishIntegration = false;
    flags = [ ];
    settings = {
      style = "full";
    };
    daemon = { };
  };
}
