{ pkgs, ... }:
let
  hostname = "mbtuandv";
  username = "tuandv";
in
{
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

  services = { };

  environment.systemPackages = with pkgs; [ ];

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
      trusted-users = [ username ];
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
    overlays = [ ];
  };
}
