{ ... }:
{
  xdg.configFile."serpl/config.toml".text = ''
    [keybindings]
    "<Ctrl-d>" = "Quit"
    "<Ctrl-c>" = "Quit"
    "<Tab>" = "LoopOverTabs"
    "<Backtab>" = "BackLoopOverTabs"
    "<Ctrl-o>" = "ProcessReplace"
    "<Ctrl-b>" = "ShowHelp"
  '';
}
