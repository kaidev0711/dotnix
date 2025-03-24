{ ... }:
{
  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = false;
    git = false;
    colors = "auto";
    icons = "auto";
    extraOptions = [
      "--group-directories-last"
    ];
  };
}
