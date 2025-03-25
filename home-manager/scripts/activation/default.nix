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

    # Alternative approach: Add to activation script
    sshPermissions = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if [ -d "$HOME/.ssh" ]; then
        chmod 700 "$HOME/.ssh"
      fi
    '';

    # brew
    installHomebrew = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      echo "Checking Homebrew..."
      if [ ! -f "/opt/homebrew/bin/brew" ]; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      else
        echo "Homebrew already installed, skipping..."
      fi
    '';
    # Set up default shell
    # postActivation = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    #   current_shell=$(basename "$SHELL")
    #   if [ "$current_shell" != "fish" ]; then
    #     echo "Changing shell to fish..."
    #     /usr/bin/chsh -s ${pkgs.fish}/bin/fish
    #   else
    #     echo "Shell is already fish, no change needed."
    #   fi
    # '';
  };
}
