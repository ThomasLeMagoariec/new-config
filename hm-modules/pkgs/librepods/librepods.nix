{
    stdenv,
    fetchFromGitHub,
    cmake,
    qt6,
}:
stdenv.mkDerivation {
    pname = "librepods";
    version = "v0.1.0-rc.4";

    src = fetchFromGitHub {
        owner = "kavishdevar";
        repo = "librepods";
        rev = "v0.1.0-rc.4";
        sha256 = "0yzdb55gkghg6s1yyq7y50l3x6iwz6vvv690g1lniiqgf51xhw0n";

    };

    sourceRoot = "source/linux";

    buildInputs = [
        cmake
        qt6.wrapQtAppsHook
        qt6.qtbase 
        qt6.qtdeclarative 
        qt6.qtconnectivity
    ];

    installPhase = ''
        runHook preinstall

        mkdir build
        cd build
        cmake ..
        cd ..
        make

        mkdir -p $out/bin
        install -Dm755 applinux $out/bin/librepods

        runHook postInstall
    '';
}
