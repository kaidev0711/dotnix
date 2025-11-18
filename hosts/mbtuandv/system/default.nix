{config, ...}: let
  username = "tuandv";
in {
  imports = [
    ./defaults
  ];
  system = {
    primaryUser = "${username}";
    stateVersion = 6;
    configurationRevision = config.rev or config.dirtyRev or null;
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
