{
  programs.zed-editor = {
    userTasks = [
      # Television
      {
        label = "File Finder";
        command = "zeditor $(tv files)";
        hide = "always";
        allow_concurrent_runs = true;
        use_new_terminal = true;
      }
    ];
  };
}
