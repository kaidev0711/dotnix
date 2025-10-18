{...}: {
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Đặng Văn Tuấn";
        email = "kaiz.developers@gmail.com";
      };
      ui = {
        editor = "hx";
        color = "always";
        merge-editor = "mergiraf";
      };
    };
  };
}
