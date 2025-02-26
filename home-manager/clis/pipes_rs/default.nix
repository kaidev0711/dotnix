{
  config,
  pkgs,
  lib,
  ...
}:
{

  xdg.configFile."pipes-rs/config.toml".text = ''
    bold = true
    color_mode = "ansi" # ansi, rgb or none
    palette = "default" # default, darker, pastel or matrix
    rainbow = 0 # 0-255
    delay_ms = 20
    inherit_style = false
    kinds = ["heavy"] # heavy, light, curved, knobby, emoji, outline, dots, blocks, sus
    num_pipes = 1
    reset_threshold = 0.5 # 0.0–1.0
    turn_chance = 0.15 # 0.0–1.0
  '';
}
