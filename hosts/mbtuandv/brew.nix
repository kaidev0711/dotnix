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
      "jordanbaird-ice"
    ];
    taps = [

    ];
    masApps = {
      "The Unarchiver" = 425424353;
      Xcode = 497799835;
    };
  };
}
