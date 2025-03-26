{ ... }:
{
  programs.gitui = {
    enable = true;
    keyConfig = ''
      (
        move_left: Some(( code: Char('h'), modifiers: "")),
        move_right: Some(( code: Char('l'), modifiers: "")),
        move_up: Some(( code: Char('k'), modifiers: "")),
        move_down: Some(( code: Char('j'), modifiers: "")),

        stash_open: Some(( code: Char('l'), modifiers: "")),
        open_help: Some(( code: F(1), modifiers: "")),

        status_reset_item: Some(( code: Char('U'), modifiers: "SHIFT")),
      )
    '';

    theme = ''
            (
          selected_tab: Some("Reset"),
          command_fg: Some("#ebdbb2"),          // fg1
          selection_bg: Some("#504945"),         // bg2
          selection_fg: Some("#fbf1c7"),         // fg0
          cmdbar_bg: Some("#282828"),           // bg0
          cmdbar_extra_lines_bg: Some("#282828"), // bg0
          disabled_fg: Some("#928374"),         // gray
          diff_line_add: Some("#b8bb26"),       // bright green
          diff_line_delete: Some("#fb4934"),    // bright red
          diff_file_added: Some("#b8bb26"),     // bright green
          diff_file_removed: Some("#fb4934"),   // bright red
          diff_file_moved: Some("#d3869b"),     // bright purple
          diff_file_modified: Some("#d79921"),  // normal yellow (điều chỉnh từ #fab387)
          commit_hash: Some("#83a598"),         // bright blue
          commit_time: Some("#d5c4a1"),         // fg2
          commit_author: Some("#8ec07c"),       // bright aqua
          danger_fg: Some("#cc241d"),           // red
          push_gauge_bg: Some("#665c54"),       // bg3
          push_gauge_fg: Some("#fe8019"),       // bright orange
          tag_fg: Some("#bdae93"),              // fg3
          branch_fg: Some("#b8bb26"),           // bright green
      )    '';
  };
}
