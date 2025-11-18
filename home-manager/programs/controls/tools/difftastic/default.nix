{...}: {
  programs.difftastic = {
    enable = true;
    git = {
      enable = false;
      diffToolMode = true;
    };
    options = {};
  };
}
