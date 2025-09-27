{...}: let
  hostname = "mbtuandv";
in {
  networking = {
    hostName = hostname;
    computerName = hostname;
    localHostName = hostname;
  };
}
