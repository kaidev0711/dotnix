{pkgs, ...}: let
  username = "tuandv";
in {
  users.users."${username}" = {
    name = "${username}";
    home = "/Users/${username}";
    shell = pkgs.fish;
  };
}
