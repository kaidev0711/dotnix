{
  config,
  pkgs,
  lib,
  ...
}:
{
  xdg.configFile."ghostty/config".text = ''
    # Shell
    command = ${pkgs.fish}/bin/fish
    # shell-integration = fish

    # Themes: ghostty +list-themes
    theme = Kanagawa Wave

    # fonts
    font-family = Cascadia Code
    font-family-bold = Cascadia Code Bold
    font-family-italic = Cascadia Code Italic
    font-family-bold-italic = Cascadia Code Bold Italic
    font-size = 15
    font-feature = -calt
    font-feature = -liga
    font-feature = -dlig

    # macos
    macos-titlebar-style = hidden
    macos-option-as-alt = true
    mouse-hide-while-typing = true
    confirm-close-surface = false
    copy-on-select = true

    # windows
    window-height = 50
    window-width = 150
    window-padding-balance = true
    background-opacity = 0.8
    background-blur = true
    unfocused-split-opacity = 0.7

    # clipboard
    clipboard-read = allow
    clipboard-write = allow

    # cursor
    shell-integration-features = no-cursor
    cursor-style = bar
    cursor-style-blink = true

    # quick terminal
    quick-terminal-position = bottom
    quick-terminal-animation-duration = 0
    quick-terminal-autohide = false

    # macos icon
    macos-icon = custom-style
    macos-icon-frame = plastic
    macos-icon-ghost-color = cba6f7
    macos-icon-screen-color = 181825

    # keybinds
    keybind = ctrl+a>q=toggle_quick_terminal
    keybind = ctrl+a>shift+\=new_split:right
    keybind = ctrl+a>shift+-=new_split:down
    keybind = ctrl+a>h=goto_split:left
    keybind = ctrl+a>l=goto_split:right
    keybind = ctrl+a>j=goto_split:bottom
    keybind = ctrl+a>k=goto_split:top
    keybind = ctrl+a>shift+l=resize_split:right,50
    keybind = ctrl+a>shift+h=resize_split:left,50
    keybind = ctrl+a>shift+j=resize_split:down,50
    keybind = ctrl+a>shift+k=resize_split:up,50
    keybind = ctrl+a>equal=equalize_splits
    keybind = ctrl+a>x=close_surface
    keybind = ctrl+a>z=toggle_split_zoom
    keybind = ctrl+a>o=write_screen_file:open
    keybind = ctrl+a>p=write_screen_file:paste
    keybind = ctrl+a>r=reload_config
    keybind = ctrl+a>i=inspector:toggle
  '';
}
