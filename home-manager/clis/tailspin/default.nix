{...}: {
  xdg.configFile."tailspin/config.toml".text = ''
    [[regexps]]
    regular_expression = '^[a-z0-9]+\s{2,}[a-zA-Z]+\s{2,}[a-zA-Z]+\s{2,}([a-zA-Z0-9-/]+)\s{2,}'
    style = { fg = "cyan" }

    [[regexps]]
    regular_expression = '^[a-z0-9]+\s{2,}[a-zA-Z]+\s{2,}([a-zA-Z]+)\s{2,}'
    style = { fg = "green", italic = true }

    [[regexps]]
    regular_expression = '^[a-z0-9]+\s{2,}([a-zA-Z]+)\s{2,}'
    style = { fg = "blue", bold = true }

    [[regexps]]
    regular_expression = '^([a-z0-9]+)\s{2,}'
    style = { fg = "yellow" }
  '';
}
