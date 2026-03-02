{ pkgs }:

pkgs.stdenvNoCC.mkDerivation {
  pname = "kde-win10";
  version = "1.0";

  src = ./kde-win10;

  installPhase = ''
    mkdir -p $out/share/plasma/look-and-feel/kde-win10
    cp -r * $out/share/plasma/look-and-feel/kde-win10
  '';
}
