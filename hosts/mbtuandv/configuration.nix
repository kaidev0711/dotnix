{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:
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
  # environment.variables.SHELL = "${pkgs.fish}/bin/fish";
  programs.fish.enable = true;

  services = { };

  environment.systemPackages = with pkgs; [ ];

  fonts = {
    packages = with pkgs; [
      cascadia-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.geist-mono
      nerd-fonts.hack
    ];
  };

  nix = {
    settings = {
      trusted-users = [ username ];
      experimental-features = "nix-command flakes";
    };
  };

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      # allowBroken = true;
    };
    overlays = [ ];
  };
}
