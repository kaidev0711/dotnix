{ ... }:
{
  programs.aerospace = {
    enable = true;
    launchd = {
      enable = true;
      keepAlive = true;
    };
    userSettings = {
      after-startup-command = [ ];
      exec-on-workspace-change = [ ];
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;
      accordion-padding = 30;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";
      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];
      on-focus-changed = [ "move-mouse window-lazy-center" ];
      automatically-unhide-macos-hidden-apps = false;

      key-mapping = {
        preset = "qwerty";
      };

      gaps = {
        inner = {
          horizontal = 5;
          vertical = 5;
        };
        outer = {
          left = 5;
          bottom = 5;
          top = 5;
          right = 5;
        };
      };

      workspace-to-monitor-force-assignment = {
        Browser = "main";
        Terminal = "main";
      };

      mode = {
        main = {
          binding = {
            alt-ctrl-slash = "layout tiles horizontal vertical";
            alt-ctrl-comma = "layout accordion horizontal vertical";

            alt-ctrl-h = "focus left";
            alt-ctrl-j = "focus down";
            alt-ctrl-k = "focus up";
            alt-ctrl-l = "focus right";

            alt-ctrl-a = "workspace Apple";
            alt-ctrl-b = "workspace Browser";
            alt-ctrl-c = "workspace Chat";
            alt-ctrl-d = "workspace Dev";
            alt-ctrl-e = "workspace Editor";
            alt-ctrl-t = "workspace Terminal";
            alt-ctrl-f = "workspace Model";

            alt-ctrl-shift-a = "move-node-to-workspace Apple --focus-follows-window";
            alt-ctrl-shift-b = "move-node-to-workspace Browser --focus-follows-window";
            alt-ctrl-shift-c = "move-node-to-workspace Chat --focus-follows-window";
            alt-ctrl-shift-d = "move-node-to-workspace Dev --focus-follows-window";
            alt-ctrl-shift-e = "move-node-to-workspace Editor --focus-follows-window";
            alt-ctrl-shift-t = "move-node-to-workspace Terminal --focus-follows-window";
            alt-ctrl-shift-f = "move-node-to-workspace Model --focus-follows-window";

            alt-ctrl-tab = "workspace-back-and-forth";
            alt-ctrl-shift-tab = "move-workspace-to-monitor --wrap-around next";

            alt-ctrl-shift-semicolon = "mode service";
            alt-ctrl-shift-r = "mode resize";
            alt-ctrl-shift-m = "mode monitor";
          };
        };

        monitor = {
          binding = {
            alt-ctrl-shift-h = [
              "move-node-to-monitor next"
              "focus-monitor next"
            ];
            alt-ctrl-shift-l = [
              "move-node-to-monitor prev"
              "focus-monitor prev"
            ];
            esc = "mode main";
          };
        };

        resize = {
          binding = {
            h = "resize width -50";
            j = "resize height +50";
            k = "resize height -50";
            l = "resize width +50";
            b = "balance-sizes";
            f = "fullscreen";
            minus = "resize smart -50";
            equal = "resize smart +50";
            esc = "mode main";
          };
        };

        service = {
          binding = {
            esc = [
              "reload-config"
              "mode main"
            ];
            r = [
              "flatten-workspace-tree"
              "mode main"
            ];
            f = [
              "layout floating tiling"
              "mode main"
            ];
            backspace = [
              "close-all-windows-but-current"
              "mode main"
            ];
            alt-ctrl-shift-h = [
              "join-with left"
              "mode main"
            ];
            alt-ctrl-shift-j = [
              "join-with down"
              "mode main"
            ];
            alt-ctrl-shift-k = [
              "join-with up"
              "mode main"
            ];
            alt-ctrl-shift-l = [
              "join-with right"
              "mode main"
            ];
            down = "volume down";
            up = "volume up";
            shift-down = [
              "volume set 0"
              "mode main"
            ];
          };
        };
      };

      on-window-detected = [
        {
          "if".app-id = "org.alacritty";
          run = [ "move-node-to-workspace Terminal" ];
        }
        {
          "if".app-id = "com.github.wez.wezterm";
          run = [ "move-node-to-workspace Terminal" ];
        }
        {
          "if".app-id = "dev.zed.Zed";
          run = [ "move-node-to-workspace Editor" ];
        }
        {
          "if".app-id = "com.apple.dt.Xcode";
          run = [
            "layout floating"
            "move-node-to-workspace Editor"
          ];
        }
        {
          "if".app-id = "org.mozilla.firefox";
          run = [ "move-node-to-workspace Browser" ];
        }
        {
          "if".app-id = "com.apple.Safari";
          run = [ "move-node-to-workspace Browser" ];
        }
        {
          "if".app-id = "com.hnc.Discord";
          run = [ "move-node-to-workspace Chat" ];
        }
        {
          "if".app-id = "ru.keepcoder.Telegram";
          run = [ "move-node-to-workspace Chat" ];
        }
        {
          "if".app-id = "org.whispersystems.signal-desktop";
          run = [ "move-node-to-workspace Chat" ];
        }
        {
          "if".app-id = "com.apple.Notes";
          run = [ "move-node-to-workspace Apple" ];
        }
        {
          "if".app-id = "com.apple.finder";
          run = [ "layout floating" ];
        }
      ];
    };
  };
}
