final: prev: {
  presenterm = prev.rustPlatform.buildRustPackage rec {
    pname = "presenterm";
    version = "0.10.1";
    src = prev.fetchFromGitHub {
      owner = "mfontanini";
      repo = "presenterm";
      tag = "v${version}";
      hash = "sha256-ow87vKHfdstL2k73wHD06HsX28mLvTrWh5yIbo/a54M=";
    };

    cargoHash = "sha256-KpwW2lblX4aCN73jWFY9Ylp+AEbGWCu/jb/c8wTao08=";

    buildInputs = [
      final.libsixel
    ];
    buildFeatures = prev.lib.optionals (!prev.stdenv.hostPlatform.isDarwin) [ "sixel" ];

    checkFlags = [
      "--skip=external_snippet"
    ];

    nativeInstallCheckInputs = [ prev.versionCheckHook ];
    versionCheckProgramArg = [ "--version" ];
    doInstallCheck = true;
    useFetchCargoVendor = true;

    meta = with prev.lib; {
      description = "Terminal based slideshow tool";
      changelog = "https://github.com/mfontanini/presenterm/releases/tag/v${version}";
      homepage = "https://github.com/mfontanini/presenterm";
      license = licenses.bsd2;
      maintainers = with maintainers; [ mikaelfangel ];
      mainProgram = "presenterm";
    };
  };
}
