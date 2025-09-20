{...}: let
  homeDirectory = "/Users/tuandv";
  username = "tuandv";
in {
  security.pam.services.sudo_local.touchIdAuth = true;
  system = {
    primaryUser = "${username}";
    stateVersion = 6;
    defaults = {
      NSGlobalDomain = {
        # _HIHideMenuBar = true;
        "com.apple.trackpad.scaling" = 3.0;
        "com.apple.sound.beep.feedback" = 0;
        AppleKeyboardUIMode = 3;
        AppleInterfaceStyle = "Dark";
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
          "/Applications/Xcode.app"
          "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
          "/Applications/Swift Playground.app"
          "/Applications/Safari.app"
          "${homeDirectory}/Applications/Home Manager Apps/Brave Browser.app"
          "${homeDirectory}/Applications/Home Manager Apps/Alacritty.app"
          "${homeDirectory}/Applications/Home Manager Apps/WezTerm.app"
          "/Applications/Discord.app"
          "/Applications/Signal.app"
          "/Applications/Telegram.app"
          "/System/Applications/Notes.app"
        ];
        persistent-others = [
          "${homeDirectory}/Documents/Books/"
          "${homeDirectory}/Downloads/"
        ];
      };
      WindowManager = {
        EnableStandardClickToShowDesktop = false;
        StandardHideWidgets = true;
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
        TrackpadThreeFingerTapGesture = 2;
        TrackpadRightClick = true;
      };
      loginwindow = {
        GuestEnabled = false;
        DisableConsoleAccess = true;
      };
      screencapture = {
        location = "${homeDirectory}/Documents/Screenshots";
        type = "png";
      };
      universalaccess = {
        reduceMotion = true;
        reduceTransparency = false;
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
