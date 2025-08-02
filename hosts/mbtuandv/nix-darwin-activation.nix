{...}: {
  system.activationScripts.setupDevelopmentTools.text = ''
    echo "Setting up development tools..." >&2

    # Check and install Xcode command line tools
    if ! xcode-select --version 2>/dev/null; then
      echo "Installing Xcode command line tools..." >&2
      xcode-select --install
    fi

    # Check and install Homebrew
    if ! /opt/homebrew/bin/brew --version 2>/dev/null; then
      echo "Installing Homebrew..." >&2
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
  '';
}
