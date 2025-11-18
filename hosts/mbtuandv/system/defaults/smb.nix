{...}: let
  hostname = "mbtuandv";
in {
  system = {
    defaults = {
      smb = {
        NetBIOSName = hostname;
      };
    };
  };
}
