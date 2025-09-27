{...}: {
  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = false;
    git = true;
    colors = "auto";
    icons = "auto";
    extraOptions = [
      "--group-directories-last"
    ];
  };
}
