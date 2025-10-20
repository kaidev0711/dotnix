{
  inputs,
  pkgs,
  ...
}: let
  starship-plugins = pkgs.fetchFromGitHub {
    owner = "Rolv-Apneseth";
    repo = "starship.yazi";
    rev = "6a0f3f788971b155cbc7cec47f6f11aebbc148c9";
    hash = "sha256-q1G0Y4JAuAv8+zckImzbRvozVn489qiYVGFQbdCxC98=";
  };
in {
  xdg.configFile = {
    "yazi/plugins/folder-rules.yazi/main.lua".text = ''
      local function setup()
      	ps.sub("cd", function()
      		local cwd = cx.active.current.cwd
      		if cwd:ends_with("Downloads") then
      			ya.emit("sort", { "mtime", reverse = true, dir_first = false })
      		else
      			ya.emit("sort", { "alphabetical", reverse = false, dir_first = true })
      		end
      	end)
      end
      return { setup = setup }
    '';
    "yazi/plugins/smart-tab.yazi/main.lua".text = ''
      --- @sync entry
      return {
      	entry = function()
      		local h = cx.active.current.hovered
      		ya.emit("tab_create", h and h.cha.is_dir and { h.url } or { current = true })
      	end,
      }
    '';
    "yazi/plugins/confirm-quit.yazi/main.lua".text = ''
      local count = ya.sync(function() return #cx.tabs end)
      local function entry()
      	if count() < 2 then
      		return ya.emit("quit", {})
      	end
      	local yes = ya.confirm {
      		pos = { "center", w = 60, h = 10 },
      		title = "Quit?",
      		content = ui.Text("There are multiple tabs open. Are you sure you want to quit?"):wrap(ui.Wrap.YES),
      	}
      	if yes then
      		ya.emit("quit", {})
      	end
      end
      return { entry = entry }
    '';
  };
  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.system}.default;
    enableFishIntegration = true;
    enableNushellIntegration = false;
    shellWrapperName = "y";
    initLua = ''
      require("full-border"):setup()
      require("smart-enter"):setup {
      	open_multi = true,
      }
      require("git"):setup{ order = 0 }
      require("folder-rules"):setup()
      -- require("starship"):setup()

      Status:children_add(function(self)
      	local h = self._current.hovered
      	if h and h.link_to then
      		return " -> " .. tostring(h.link_to)
      	else
      		return ""
      	end
      end, 3300, Status.LEFT)

      Status:children_add(function()
      	local h = cx.active.current.hovered
      	if not h or ya.target_family() ~= "unix" then
      		return ""
      	end

      	return ui.Line {
      		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
      		":",
      		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
      		" ",
      	}
      end, 500, Status.RIGHT)
    '';
    settings = {
      mgr = {
        ratio = [
          3
          6
          9
        ];
        sort_dir_first = true;
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        linemode = "size";
        show_hidden = true;
        show_symlink = true;
        scrolloff = 5;
      };
      preview = {
        wrap = "yes";
        max_width = 1000;
        max_height = 1000;
      };
      opener = {
        bulk-rename = [
          {
            run = ''hx "$@"'';
            block = true;
          }
        ];
        set-wallpaper = [
          {
            run = ''
              osascript -e 'on run {img}' -e 'tell application "System Events" to set picture of every desktop to img' -e 'end run' "$1"
            '';
            for = "macos";
            desc = "Set as wallpaper";
          }
        ];
      };
      open = {
        prepend_rules = [
          {
            name = "bulk-rename.txt";
            use = "bulk-rename";
          }
          {
            mime = "image/*";
            use = ["set-wallpaper" "open"];
          }
        ];
      };
      plugin = {
        prepend_previewers = [
          {
            name = "*.md";
            run = ''piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dark "$1"'';
          }
          # Archive previewer
          {
            mime = "application/*zip";
            run = "ouch";
          }
          {
            mime = "application/x-tar";
            run = "ouch";
          }
          {
            mime = "application/x-bzip2";
            run = "ouch";
          }
          {
            mime = "application/x-7z-compressed";
            run = "ouch";
          }
          {
            mime = "application/x-rar";
            run = "ouch";
          }
          {
            mime = "application/x-xz";
            run = "ouch";
          }
          {
            mime = "application/xz";
            run = "ouch";
          }
        ];
        prepend_preloaders = [
          {
            name = "/remote/**";
            run = "noop";
          }
        ];
        prepend_fetchers = [
          {
            id = "git";
            name = "*";
            run = "git";
          }
          {
            id = "git";
            name = "*/";
            run = "git";
          }
        ];
      };
    };
    keymap = {
      input.prepend_keymap = [
        {
          on = "<Esc>";
          run = "close";
          desc = "Cancel input";
        }
      ];
      mgr.prepend_keymap = [
        {
          on = "!";
          for = "unix";
          run = ''shell "$SHELL" --block'';
          desc = "Open $SHELL here";
        }
        {
          on = "<Esc>";
          run = "close";
          desc = "Cancel input";
        }
        {
          on = "l";
          run = "plugin smart-enter";
          desc = "Enter the child directory, or open the file";
        }
        {
          on = [
            "g"
            "p"
          ];
          run = ''shell -- ya emit cd "$(git rev-parse --show-toplevel)"'';
        }
        {
          on = [
            "g"
            "r"
          ];
          run = "cd ~/devs/_rust";
          desc = "Go to the rust directory";
        }
        {
          on = "<C-p>";
          run = ''shell -- qlmanage -p "$@"'';
        }
        {
          on = "T";
          run = "plugin toggle-pane max-preview";
          desc = "Maximize or restore the preview pane";
        }
        {
          on = "p";
          run = "plugin smart-paste";
          desc = "Paste into the hovered directory or CWD";
        }
        {
          on = "t";
          run = "plugin smart-tab";
          desc = "Create a tab and enter the hovered directory";
        }
        {
          on = "F";
          run = "plugin smart-filter";
          desc = "Smart filter";
        }
        {
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }
        {
          on = [
            "g"
            "c"
          ];
          run = "plugin vcs-files";
          desc = "Show Git file changes";
        }
        {
          on = ["C"];
          run = "plugin ouch";
          desc = "Compress with ouch";
        }
        {
          on = "q";
          run = "plugin confirm-quit";
        }
      ];
    };
    theme = {};
    flavors = {};
    plugins = {
      git = "${inputs.yazi-plugins}/git.yazi";
      piper = "${inputs.yazi-plugins}/piper.yazi";
      vcs-files = "${inputs.yazi-plugins}/vcs-files.yazi";
      chmod = "${inputs.yazi-plugins}/chmod.yazi";
      full-border = "${inputs.yazi-plugins}/full-border.yazi";
      toggle-pane = "${inputs.yazi-plugins}/toggle-pane.yazi";
      smart-enter = "${inputs.yazi-plugins}/smart-enter.yazi";
      smart-paste = "${inputs.yazi-plugins}/smart-paste.yazi";
      smart-filter = "${inputs.yazi-plugins}/smart-filter.yazi";
      starship = "${starship-plugins}";
      ouch = "${pkgs.yaziPlugins.ouch}";
    };
  };
}
