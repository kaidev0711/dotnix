{...}: {
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Đặng Văn Tuấn";
        email = "kaiz.developers@gmail.com";
      };
      ui.merge-editor = "mergiraf";
    };
  };
}
