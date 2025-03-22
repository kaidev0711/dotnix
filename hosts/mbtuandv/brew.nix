{
  homebrew = {
    enable = true;
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
      "raycast"
    ];
    taps = [

    ];
    masApps = {
      "The Unarchiver" = 425424353;
      Xcode = 497799835;
    };
  };
}
