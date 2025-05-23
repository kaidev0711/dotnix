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
      "keka"
      "brave-browser"
      "spotify"
      "skim"
    ];
    taps = [

    ];
    masApps = {
      "Swift Playground" = 1496833156;
      Xcode = 497799835;
    };
  };
}
