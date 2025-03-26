{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.activation = {
    generateSshKey = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
        /usr/bin/ssh-keygen -t ed25519 -f "$HOME/.ssh/id_ed25519" -N "" -C "kaiz.developers@gmail.com"
        chmod 600 "$HOME/.ssh/id_ed25519"
        chmod 644 "$HOME/.ssh/id_ed25519.pub"
        ${pkgs.gh}/bin/gh ssh-key add ~/.ssh/id_ed25519.pub --type authentication --title mbtuandv
        ${pkgs.gh}/bin/gh ssh-key add ~/.ssh/id_ed25519.pub --type signing --title mbtuandv
      fi
    '';

    sshPermissions = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if [ -d "$HOME/.ssh" ]; then
        chmod 700 "$HOME/.ssh"
      fi
    '';

  };
}
