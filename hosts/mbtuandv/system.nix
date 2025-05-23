{ ... }:
let
  homeDirectory = "/Users/tuandv";
  username = "tuandv";
in
{
  security.pam.services.sudo_local.touchIdAuth = true;
  system = {
    primaryUser = "${username}";
    stateVersion = 6;
    defaults = {
      NSGlobalDomain = {
        # _HIHideMenuBar = true;
        "com.apple.trackpad.scaling" = 3.0;
        "com.apple.sound.beep.feedback" = 0;
        AppleInterfaceStyle = "Dark";
        AppleKeyboardUIMode = 3;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        NSWindowShouldDragOnGesture = true;
        NSAutomaticWindowAnimationsEnabled = true;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticInlinePredictionEnabled = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
      };
      dock = {
        autohide = true;
        tilesize = 32;
        static-only = false;
        magnification = true;
        largesize = 40;
        orientation = "right";
        show-recents = false;
        mru-spaces = false;
        expose-group-apps = true;
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
        persistent-apps = [
          "/System/Applications/Launchpad.app"
          "/Applications/Xcode.app"
          "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
          "/Applications/Swift Playground.app"
          "/Applications/Safari.app"
          "/Applications/Brave Browser.app"
          "${homeDirectory}/Applications/Home Manager Apps/Google Chrome.app"
          "${homeDirectory}/Applications/Home Manager Apps/Alacritty.app"
          "${homeDirectory}/Applications/Home Manager Apps/WezTerm.app"
          "/Applications/Ghostty.app"
          "${homeDirectory}/Applications/Home Manager Apps/Telegram.app"
          "${homeDirectory}/Applications/Home Manager Apps/Discord.app"
          "/Applications/Spotify.app"
        ];
        persistent-others = [
          "${homeDirectory}/Documents/Books/"
          "${homeDirectory}/Downloads/"
        ];
      };
      WindowManager = {
        EnableStandardClickToShowDesktop = false;
        HideDesktop = true;
        StageManagerHideWidgets = true;
        EnableTilingByEdgeDrag = false;
        EnableTopTilingByEdgeDrag = false;
        EnableTilingOptionAccelerator = false;
        EnableTiledWindowMargins = false;
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        ShowPathbar = true;
        ShowStatusBar = true;
        QuitMenuItem = true;
        FXDefaultSearchScope = "SCcf";
        FXPreferredViewStyle = "Nlsv";
        CreateDesktop = false;
        FXEnableExtensionChangeWarning = true;
        NewWindowTarget = "Home";
      };
      trackpad = {
        Clicking = true;
        TrackpadRightClick = true;
      };
      loginwindow = {
        GuestEnabled = false;
        DisableConsoleAccess = true;
      };
      screencapture = {
        location = "${homeDirectory}/Pictures/Screenshots";
        type = "png";
      };
      universalaccess = {
        reduceMotion = true;
        reduceTransparency = true;
      };
      controlcenter = {
        BatteryShowPercentage = true;
        Sound = false;
        Bluetooth = false;
        AirDrop = false;
        FocusModes = false;
        NowPlaying = false;
      };
      hitoolbox = {
        AppleFnUsageType = "Show Emoji & Symbols";
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
