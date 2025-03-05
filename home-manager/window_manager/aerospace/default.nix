{ pkgs, ... }:
{
  xdg.configFile."aerospace/aerospace.toml".text = ''
    after-login-command = []
    after-startup-command = []
    exec-on-workspace-change = []
    start-at-login = true
    enable-normalization-flatten-containers = true
    enable-normalization-opposite-orientation-for-nested-containers = true
    accordion-padding = 30
    default-root-container-layout = 'tiles'
    default-root-container-orientation = 'auto'
    on-focused-monitor-changed = ['move-mouse monitor-lazy-center']
    on-focus-changed = ['move-mouse window-lazy-center']
    automatically-unhide-macos-hidden-apps = false
    [key-mapping]
    preset = 'qwerty'
    [gaps]
    inner.horizontal = 5
    inner.vertical = 5
    outer.left = 5
    outer.bottom = 5
    outer.top = 5
    # outer.top =        [{ monitor."built-in" = 5 }, 20]
    # outer.top = [{ monitor."Built-in Retina Display" = 10 }, 40]
    outer.right = 5
    [workspace-to-monitor-force-assignment]
    1 = 1 # Monitor sequence number from left to right. 1-based indexing
    Browser = 'main' # Main monitor
    Terminal = "main"
    # Terminal = '^built-in retina display$' # Case insensitive regex match
    3 = 'secondary' # Non-main monitor in case when there are only two monitors
    4 = 'built-in' # Case insensitive regex substring
    6 = [
      'secondary',
      'dell',
    ] # You can specify multiple patterns. The first matching pattern will be used
    [mode.main.binding]
    # All possible keys:
    # - Letters.        a, b, c, ..., z
    # - Numbers.        0, 1, 2, ..., 9
    # - Keypad numbers. keypad0, keypad1, keypad2, ..., keypad9
    # - F-keys.         f1, f2, ..., f20
    # - Special keys.   minus, equal, period, comma, slash, backslash, quote, semicolon, backtick,
    #                   leftSquareBracket, rightSquareBracket, space, enter, esc, backspace, tab
    # - Keypad special. keypadClear, keypadDecimalMark, keypadDivide, keypadEnter, keypadEqual,
    #                   keypadMinus, keypadMultiply, keypadPlus
    # - Arrows.         left, down, up, right

    # All possible modifiers: cmd, alt, ctrl, shift

    # All possible commands: https://nikitabobko.github.io/AeroSpace/commands

    # See: https://nikitabobko.github.io/AeroSpace/commands#exec-and-forget
    # You can uncomment the following lines to open up terminal with alt + enter shortcut (like in i3)
    # alt-enter = '''exec-and-forget osascript -e '
    # tell application "Terminal"
    #     do script
    #     activate
    # end tell'
    # '''


    alt-ctrl-slash = 'layout tiles horizontal vertical'
    alt-ctrl-comma = 'layout accordion horizontal vertical'

    alt-ctrl-h = 'focus left'
    alt-ctrl-j = 'focus down'
    alt-ctrl-k = 'focus up'
    alt-ctrl-l = 'focus right'

    alt-ctrl-shift-h = 'move left'
    alt-ctrl-shift-j = 'move down'
    alt-ctrl-shift-k = 'move up'
    alt-ctrl-shift-l = 'move right'

    alt-ctrl-1 = 'workspace 1'
    alt-ctrl-2 = 'workspace 2'
    alt-ctrl-3 = 'workspace 3'
    alt-ctrl-4 = 'workspace 4'
    alt-ctrl-5 = 'workspace 5'
    alt-ctrl-6 = 'workspace 6'
    alt-ctrl-7 = 'workspace 7'
    alt-ctrl-8 = 'workspace 8'
    alt-ctrl-9 = 'workspace 9'
    alt-ctrl-a = 'workspace Apple'
    alt-ctrl-b = 'workspace Browser'
    alt-ctrl-c = 'workspace Chat'
    alt-ctrl-d = 'workspace Dev'
    alt-ctrl-e = 'workspace E'
    alt-ctrl-f = 'workspace F'
    alt-ctrl-g = 'workspace G'
    alt-ctrl-i = 'workspace I'
    alt-ctrl-m = 'workspace M'
    alt-ctrl-n = 'workspace N'
    alt-ctrl-o = 'workspace O'
    alt-ctrl-p = 'workspace P'
    alt-ctrl-q = 'workspace Q'
    alt-ctrl-r = 'workspace R'
    alt-ctrl-s = 'workspace S'
    alt-ctrl-t = 'workspace Terminal'
    alt-ctrl-u = 'workspace U'
    alt-ctrl-v = 'workspace V'
    alt-ctrl-w = 'workspace W'
    alt-ctrl-x = 'workspace X'
    alt-ctrl-y = 'workspace Y'
    alt-ctrl-z = 'workspace Z'

    alt-ctrl-shift-1 = 'move-node-to-workspace 1 --focus-follows-window'
    alt-ctrl-shift-2 = 'move-node-to-workspace 2 --focus-follows-window'
    alt-ctrl-shift-3 = 'move-node-to-workspace 3 --focus-follows-window'
    alt-ctrl-shift-4 = 'move-node-to-workspace 4 --focus-follows-window'
    alt-ctrl-shift-5 = 'move-node-to-workspace 5 --focus-follows-window'
    alt-ctrl-shift-6 = 'move-node-to-workspace 6 --focus-follows-window'
    alt-ctrl-shift-7 = 'move-node-to-workspace 7 --focus-follows-window'
    alt-ctrl-shift-8 = 'move-node-to-workspace 8 --focus-follows-window'
    alt-ctrl-shift-9 = 'move-node-to-workspace 9 --focus-follows-window'
    alt-ctrl-shift-a = 'move-node-to-workspace Apple --focus-follows-window'   # Apple
    alt-ctrl-shift-b = 'move-node-to-workspace Browser --focus-follows-window' # Browser
    alt-ctrl-shift-c = 'move-node-to-workspace Chat --focus-follows-window'    # Chat 
    alt-ctrl-shift-d = 'move-node-to-workspace Dev --focus-follows-window'     # Dev
    alt-ctrl-shift-e = 'move-node-to-workspace E --focus-follows-window'
    alt-ctrl-shift-f = 'move-node-to-workspace F --focus-follows-window'
    alt-ctrl-shift-g = 'move-node-to-workspace G --focus-follows-window'
    alt-ctrl-shift-i = 'move-node-to-workspace I --focus-follows-window'
    # alt-ctrl-shift-m = 'move-node-to-workspace M --focus-follows-window'
    alt-ctrl-shift-n = 'move-node-to-workspace N --focus-follows-window'
    alt-ctrl-shift-o = 'move-node-to-workspace O --focus-follows-window'
    alt-ctrl-shift-p = 'move-node-to-workspace P --focus-follows-window'
    alt-ctrl-shift-q = 'move-node-to-workspace Q --focus-follows-window'
    # alt-ctrl-shift-r = 'move-node-to-workspace R'
    alt-ctrl-shift-s = 'move-node-to-workspace S --focus-follows-window'
    alt-ctrl-shift-t = 'move-node-to-workspace Terminal --focus-follows-window' # Terminal
    alt-ctrl-shift-u = 'move-node-to-workspace U --focus-follows-window'
    alt-ctrl-shift-v = 'move-node-to-workspace V --focus-follows-window'
    alt-ctrl-shift-w = 'move-node-to-workspace W --focus-follows-window'
    alt-ctrl-shift-x = 'move-node-to-workspace X --focus-follows-window'
    alt-ctrl-shift-y = 'move-node-to-workspace Y --focus-follows-window'
    alt-ctrl-shift-z = 'move-node-to-workspace Z --focus-follows-window'

    alt-ctrl-tab = 'workspace-back-and-forth'

    alt-ctrl-shift-tab = 'move-workspace-to-monitor --wrap-around next'

    # mode 
    alt-ctrl-shift-semicolon = 'mode service'
    alt-ctrl-shift-r = 'mode resize'
    alt-ctrl-shift-m = 'mode monitor'

    [mode.monitor.binding]
    alt-ctrl-shift-h = ['move-node-to-monitor next', 'focus-monitor next']
    alt-ctrl-shift-l = ['move-node-to-monitor prev', 'focus-monitor prev']
    esc = 'mode main'

    [mode.resize.binding]
    h = 'resize width -50'
    j = 'resize height +50'
    k = 'resize height -50'
    l = 'resize width +50'
    b = 'balance-sizes'
    f = "fullscreen"
    minus = 'resize smart -50'
    equal = 'resize smart +50'
    esc = 'mode main'

    [mode.service.binding]
    esc = ['reload-config', 'mode main']
    r = ['flatten-workspace-tree', 'mode main']
    f = ['layout floating tiling', 'mode main']
    backspace = ['close-all-windows-but-current', 'mode main']

    # s = ['layout sticky tiling', 'mode main']

    alt-ctrl-shift-h = ['join-with left', 'mode main']
    alt-ctrl-shift-j = ['join-with down', 'mode main']
    alt-ctrl-shift-k = ['join-with up', 'mode main']
    alt-ctrl-shift-l = ['join-with right', 'mode main']

    down = 'volume down'
    up = 'volume up'
    shift-down = ['volume set 0', 'mode main']

    [[on-window-detected]]
    if.app-id = "com.mitchellh.ghostty"
    run = 'move-node-to-workspace Terminal'
    # run = ["layout floating", 'move-node-to-workspace Terminal']

    [[on-window-detected]]
    if.app-id = "org.alacritty"
    run = 'move-node-to-workspace Terminal'

    [[on-window-detected]]
    if.app-id = "app.zen-browser.zen"
    run = 'move-node-to-workspace Browser'

    [[on-window-detected]]
    if.app-id = "com.apple.Safari"
    run = 'move-node-to-workspace Browser'

    [[on-window-detected]]
    if.app-id = "com.hnc.Discord"
    run = 'move-node-to-workspace Chat'

    [[on-window-detected]]
    if.app-id = 'com.apple.finder'
    run = 'layout floating'
    # run = 'move-node-to-workspace Files'

  '';
}
