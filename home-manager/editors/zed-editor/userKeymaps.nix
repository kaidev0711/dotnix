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
        };
      }
    ];
  };
}
