{...}: let
  username = "tuandv";
in {
  imports = [
    ./substituters.nix
    ./nixpkgs.nix
  ];
  nix = {
    settings = {
      trusted-users = ["@admin" username];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
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
}
