{pkgs, ...}: {
  services = {
    postgresql = {
      enable = true;
      package = pkgs.postgresql;
      dataDir = "/Users/tuandv/Database/_postgresql/17";
      enableTCPIP = true;
      authentication = pkgs.lib.mkOverride 10 ''
        #type database DBuser origin-address auth-method
        local all      all     trust
        host  all      all     127.0.0.1/32   trust
        host  all      all     ::1/128        trust
      '';
    };
  };
}
