{pkgs, ...}: {
  programs.nushell = {
    plugins = with pkgs.nushellPlugins; [
      query
      polars
      formats
    ];
  };
}
