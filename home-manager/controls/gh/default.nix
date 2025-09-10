{...}: {
  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
    settings = {
      editor = "hx";
      git_protocol = "ssh";
    };
  };
}
