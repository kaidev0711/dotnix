{ pkgs, ... }:
let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "b12a9ab085a8c2fe2b921e1547ee667b714185f9";
    hash = "sha256-LWN0riaUazQl3llTNNUMktG+7GLAHaG/IxNj1gFhDRE=";
  };
  starship-plugins = pkgs.fetchFromGitHub {
    owner = "Rolv-Apneseth";
    repo = "starship.yazi";
    rev = "6fde3b2d9dc9a12c14588eb85cf4964e619842e6";
    hash = "sha256-+CSdghcIl50z0MXmFwbJ0koIkWIksm3XxYvTAwoRlDY=";
  };
in
{
  xdg.configFile = {
    "yazi/plugins/folder-rules.yazi/main.lua".text = ''
      local function setup()
      	ps.sub("cd", function()
      		local cwd = cx.active.current.cwd
      		if cwd:ends_with("Downloads") then
      			ya.mgr_emit("sort", { "mtime", reverse = true, dir_first = false })
      		else
      			ya.mgr_emit("sort", { "alphabetical", reverse = false, dir_first = true })
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
      		ya.mgr_emit("tab_create", h and h.cha.is_dir and { h.url } or { current = true })
      	end,
      }
    '';
  };
  programs.yazi = {
    enable = true;
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
      require("starship"):setup()
    '';
    settings = {
      manager = {
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
            run = ''$EDITOR "$@"'';
            block = true;
          }
        ];
      };
      open = {
        prepend_rules = [
          {
            name = "bulk-rename.txt";
            use = "bulk-rename";
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
      manager.prepend_keymap = [
        {
          on = "!";
          run = ''shell "$SHELL" --block --confirm'';
          desc = "Open shell here";
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
            "r"
          ];
          run = "cd ~/Devs/_rust";
          desc = "Go to the rust directory";
        }
        {
          on = [
            "g"
            "n"
          ];
          run = "cd ~/Documents/Notes";
          desc = "Go to the Notes directory";
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
          on = [ "C" ];
          run = "plugin ouch";
          desc = "Compress with ouch";
        }
      ];
    };
    plugins = {
      git = "${yazi-plugins}/git.yazi";
      piper = "${yazi-plugins}/piper.yazi";
      vcs-files = "${yazi-plugins}/vcs-files.yazi";
      chmod = "${yazi-plugins}/chmod.yazi";
      full-border = "${yazi-plugins}/full-border.yazi";
      toggle-pane = "${yazi-plugins}/toggle-pane.yazi";
      smart-enter = "${yazi-plugins}/smart-enter.yazi";
      smart-paste = "${yazi-plugins}/smart-paste.yazi";
      smart-filter = "${yazi-plugins}/smart-filter.yazi";
      starship = "${starship-plugins}";
      ouch = "${pkgs.yaziPlugins.ouch}";
    };
  };
  catppuccin.yazi = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };
}
