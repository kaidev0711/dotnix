{ ... }:
{
  xdg.configFile."glow/glow.yml".text = ''
    # style name or JSON path (default "auto")
    style: "auto"
    # mouse support (TUI-mode only)
    mouse: true
    # use pager to display markdown
    pager: true
    # word-wrap at width
    width: 100
    # show all files, including hidden and ignored.
    all: false
  '';
}
