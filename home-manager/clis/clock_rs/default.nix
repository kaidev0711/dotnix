{...}: {
  programs.clock-rs = {
    enable = true;
    settings = {
      general = {
        color = "magenta";
        interval = 250;
        blink = false;
        bold = true;
      };
      position = {
        horizontal = "center";
        vertical = "center";
      };
      date = {
        fmt = "%d-%m-%Y";
        use_12h = false;
        utc = false;
        hide_seconds = true;
      };
    };
  };
}
