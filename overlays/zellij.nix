final: prev: {
  zellij = prev.rustPlatform.buildRustPackage rec {
    version = "0.42.0";
    pname = "zellij";

    src = prev.fetchFromGitHub {
      owner = "zellij-org";
      repo = pname;
      rev = "v0.42.0";
      sha256 = "sha256-qvm8mRm/YYcuNX2Rv0tYjcIXjaF9dkwd7wpL++ho3t0=";
    };
    useFetchCargoVendor = true;
    cargoHash = "sha256-cAO8A/e6tkUY7pm/T4Riz4UPIc22oj5FFC6sQL1QIuc=";
    env.OPENSSL_NO_VENDOR = 1;
    nativeBuildInputs = [
      final.mandown
      final.installShellFiles
      final.pkg-config
      (prev.lib.getDev final.curl)
    ];
    buildInputs = [
      final.curl
      final.openssl
    ];
  };
}
