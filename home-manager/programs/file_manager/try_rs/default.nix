{...}: {
  xdg.configFile."try-rs/config.toml".text = ''
    tries_path = "~/Devs/_projects"
    editor = "hx"
    theme = "Catppuccin Mocha"
  '';
}
