{...}: {
  programs.navi = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      client.tealdeer = true;
    };
  };
}
