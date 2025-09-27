{...}: {
  xdg.configFile."scooter/config.toml".text = ''
    [editor_open]
    command = "hx %file +%line"
    exit = false
    [preview]
    syntax_highlighting = true
    syntax_highlighting_theme = "base16-mocha.dark"
    [style]
    true_color = true
    [search]
    disable_prepopulated_fields = false
  '';
}
