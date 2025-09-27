{...}: {
  programs.fish = {
    functions = {
      fish_greeting = '''';
      gitignore = "curl -sL https://www.gitignore.io/api/$argv";
      mkcd = ''
        mkdir -p $argv[1]
        and cd $argv[1]
      '';
      aesw = ''
        set selected_window (aerospace list-windows --all | tv)

        if test -n "$selected_window"
            set window_id (echo $selected_window | awk '{print $1}')
            aerospace focus --window-id $window_id
        end
      '';
    };
  };
}
