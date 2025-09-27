{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    sensibleOnTop = false;
    historyLimit = 10000;
    escapeTime = 0;
    baseIndex = 1;
    clock24 = true;
    keyMode = "vi";
    prefix = "C-a";
    shell = "${pkgs.fish}/bin/fish";
    terminal = "tmux-256color";
    extraConfig = ''
      set -ag terminal-overrides ",xterm-256color:RGB"

      set -g mouse on

      set -g status-position bottom
      set -g status on
      set -g focus-events on
      set -g status-interval 5
      set -sg repeat-time 500

      set -g visual-activity off
      set -g visual-bell off
      set -g visual-silence off
      set -g monitor-activity off
      set -g bell-action none


      set -g detach-on-destroy off
      set-window-option -g automatic-rename on
      setw -g xterm-keys on
      setw -g aggressive-resize on
      set-option -g allow-passthrough on
      set-option -g renumber-windows on

      set-hook -g after-new-window 'command-prompt -I "#{window_name}" "rename-window '%%'"'

      bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"
      bind R command-prompt -I "#{session_name}" "rename-session '%%'"

      unbind C-b
      unbind '"'
      unbind %
      unbind "\$"
      unbind n
      unbind p
      unbind &

      bind | split-window -h -c "#{pane_current_path}"
      bind _ split-window -v -c "#{pane_current_path}"

      bind -n S-Left previous-window
      bind -n S-Right next-window

      bind -r C-h select-window -t :-
      bind -r C-l select-window -t :+

      bind -r H resize-pane -L 10
      bind -r J resize-pane -D 10
      bind -r K resize-pane -U 10
      bind -r L resize-pane -R 10

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind x kill-pane
      bind X kill-window

      bind > swap-pane -D
      bind < swap-pane -U

      bind c new-window -c "#{pane_current_path}"
    '';
  };
}
