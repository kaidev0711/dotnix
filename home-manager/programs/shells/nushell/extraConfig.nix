{...}: {
  programs.nushell = {
    extraConfig = ''
      $env.config.show_banner = false
      $env.config.buffer_editor = "hx"
      def --env y [...args] {
      	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
      	yazi ...$args --cwd-file $tmp
      	let cwd = (open $tmp)
      	if $cwd != "" and $cwd != $env.PWD {
      		cd $cwd
      	}
      	rm -fp $tmp
      }

      alias nu-open = open
      alias open = ^open

      export def dmy [] { (date now | format date %d-%m-%Y) }
      export def ymd [] { (date now | format date %Y-%m-%d) }

      export def --env mkcd [dirname: path] {
        mkdir $dirname
        cd $dirname
      }

      def aesw [] {
        let selected_window = (aerospace list-windows --all | tv | str trim)

        if ($selected_window | is-not-empty) {
          let window_id = ($selected_window | split row " " | first)
          aerospace focus --window-id $window_id
        }
      }

    '';
  };
}
