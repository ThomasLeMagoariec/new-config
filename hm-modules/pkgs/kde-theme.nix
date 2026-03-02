{ pkgs }:

pkgs.stdenvNoCC.mkDerivation {
  pname = "kde-mytheme";
  version = "1.0";

  src = ./kde-mytheme;

  installPhase = ''
    mkdir -p $out/share/plasma/look-and-feel/mytheme
    cp -r * $out/share/plasma/look-and-feel/mytheme
  '';
}
