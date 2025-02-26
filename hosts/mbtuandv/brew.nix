{
  homebrew = {
    enable = true;
    # global = { autoUpdate = false; };
    onActivation = {
      cleanup = "zap";
      upgrade = true;
      autoUpdate = true;
    };
    brews = [
      "mas"
    ];
    casks = [
      "ghostty"
      "zen-browser"
      "discord"
      "raycast"
    ];
    taps = [

    ];
    masApps = {
      "The Unarchiver" = 425424353;
      "Hidden Bar" = 1452453066;
      Xcode = 497799835;
    };
  };
}
