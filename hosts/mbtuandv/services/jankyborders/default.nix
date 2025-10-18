{pkgs, ...}: {
  services.jankyborders = {
    enable = true;
    package = pkgs.jankyborders;
    width = 5.0;
    inactive_color = "gradient(top_left=0x40ff9e64,bottom_right=0x40bb9af7)";
    active_color = "gradient(top_left=0xffff9e64,bottom_right=0xffbb9af7)";
  };
}
