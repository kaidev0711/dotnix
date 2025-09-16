{
  config,
  inputs,
  ...
}: {
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "tuandv";
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };
    mutableTaps = false;
  };
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      upgrade = true;
      autoUpdate = true;
    };
    brews = [
      "mas"
      "sniffnet"
    ];
    casks = [
      "keka"
      "skim"
      "signal"
      "telegram"
      "discord"
      "brave-browser"
    ];
    taps = builtins.attrNames config.nix-homebrew.taps;
    masApps = {
      "Swift Playground" = 1496833156;
      Xcode = 497799835;
    };
  };
}
