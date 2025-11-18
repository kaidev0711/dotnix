{...}: {
  programs.zellij = {
    layouts = {
      rust = ''
        layout {
            tab name="Rust" {
                pane split_direction="vertical" {
                    pane edit="src/main.rs" size="60%" focus=true
                    pane split_direction="horizontal" size="40%"{
                        pane command="bacon" {
                            args "run"
                        }
                    }
                }
                pane size=1 borderless=true {
                    plugin location="zellij:compact-bar"
                }
        	  }
        }
      '';
    };
  };
}
