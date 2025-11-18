{
  config,
  inputs,
  ...
}: let
  username = "tuandv";
in {
  imports = [inputs.nix-homebrew.darwinModules.nix-homebrew];
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = username;
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
    ];
    casks = [
      # personal
      "keka"
      "signal"
      "telegram"
      "discord"
      "cloudflare-warp"
      "openkey"
      "iina"
      # "servo"
      # Work
      "google-chrome"
      "zoom"
      "microsoft-outlook"
      "anydesk"
    ];
    taps = builtins.attrNames config.nix-homebrew.taps;
    masApps = {
      "Swift Playground" = 1496833156;
      Xcode = 497799835;
      "WPS Office" = 1468073139;
    };
  };
}
