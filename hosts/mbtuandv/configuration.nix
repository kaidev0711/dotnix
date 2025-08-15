{pkgs, ...}: let
  hostname = "mbtuandv";
  username = "tuandv";
in {
  imports = [
    ./system.nix
    ./brew.nix
    ./nix-darwin-activation.nix
  ];
  networking.hostName = hostname;
  networking.computerName = hostname;
  system.defaults.smb.NetBIOSName = hostname;

  users.users."${username}" = {
    name = "${username}";
    home = "/Users/${username}";
    shell = pkgs.nushell;
  };
  programs.fish.enable = true;

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

  environment.systemPackages = with pkgs; [];

  fonts = {
    packages = with pkgs; [
      cascadia-code
      jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.geist-mono
      nerd-fonts.hack
    ];
  };

  nix = {
    settings = {
      substituters = [
        "https://cache.nixos.org"
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = [username];
      experimental-features = "nix-command flakes";
      warn-dirty = false;
    };
    optimise = {
      automatic = true;
    };
    gc = {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 0;
        Minute = 0;
      };
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
    overlays = [];
  };
}
