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
    ];
    taps = [

    ];
    masApps = {
      "Swift Playground" = 1496833156;
      Xcode = 497799835;
    };
  };
}
