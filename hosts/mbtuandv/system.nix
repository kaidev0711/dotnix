{
  security.pam.services.sudo_local.touchIdAuth = true;
  system = {
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
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
        persistent-apps = [
          "/System/Applications/Launchpad.app"
          "/Applications/Safari.app"
          "/Applications/Xcode.app"
          "/Applications/Ghostty.app"
          "/Applications/Discord.app"
          "/Applications/Zen Browser.app"
          "/Users/tuandv/Applications/Home Manager Apps/Alacritty.app"
        ];
        persistent-others = [ ];
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
        location = "~/Pictures/Screenshots";
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
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
