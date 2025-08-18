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
      "keka"
      "skim"
      "signal"
      "telegram"
      "discord"
      "brave-browser"
    ];
    taps = [
    ];
    masApps = {
      "Swift Playground" = 1496833156;
      Xcode = 497799835;
    };
  };
}
