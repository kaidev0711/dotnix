{...}: let
  homeDirectory = "/Users/tuandv";
in {
  system = {
    defaults = {
      screencapture = {
        location = "${homeDirectory}/Documents/Screenshots";
        type = "png";
      };
    };
  };
}
