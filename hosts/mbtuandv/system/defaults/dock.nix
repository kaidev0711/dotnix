{...}: let
  homeDirectory = "/Users/tuandv";
in {
  system = {
    defaults = {
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
          "${homeDirectory}/Applications/Home Manager Apps/Ghostty.app"
          "${homeDirectory}/Applications/Home Manager Apps/UTM.app"
          "/Applications/Discord.app"
          "/Applications/Signal.app"
          "/Applications/Telegram.app"
          "${homeDirectory}/Applications/Home Manager Apps/Zotero.app"
          "/System/Applications/Notes.app"
        ];
        persistent-others = [
          "${homeDirectory}/Documents/Books/"
          "${homeDirectory}/Downloads/"
        ];
      };
    };
  };
}
