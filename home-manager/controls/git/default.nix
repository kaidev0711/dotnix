{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.git = {
    enable = true;
    userName = "Dang Van Tuan";
    userEmail = "kaiz.developers@gmail.com";
    ignores = [
      ".DS_Store"
      ".jj"
    ];
    lfs = {
      enable = true;
    };
    # signing = {
    #   signByDefault = true;
    # };
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      core.editor = "hx";
      color = {
        ui = true;
      };
      # credential.helper = "store";
      # fetch.prune = true;
    };
  };
}
