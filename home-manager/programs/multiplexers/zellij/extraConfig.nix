{...}: {
  programs.zellij = {
    extraConfig = ''
      keybinds {
        shared_except "locked" {
          bind "Ctrl y" {
              LaunchOrFocusPlugin "file:~/.config/zellij/plugins/room.wasm" {
                  floating true
                  ignore_case true
                  quick_jump true
              }
          }
          bind "Alt 0" {
              LaunchPlugin "file:~/.config/zellij/plugins/grab.wasm"
          }
        }
      }
    '';
  };
}
