{
  programs.zed-editor = {
    userKeymaps = [
      {
        bindings = {
          # Television
          "cmd-p" = [
            "task::Spawn"
            {
              task_name = "File Finder";
              reveal_target = "center";
            }
          ];
          "space f w" = [
            "task::Spawn"
            {
              task_name = "Live Grep";
              reveal_target = "center";
            }
          ];
        };
      }
    ];
  };
}
