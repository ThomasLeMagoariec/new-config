# default.nix
{ pkgs }:

let
  palette = import ./palette.nix;

  colors = import ./colors.nix {
    inherit pkgs palette;
  };

  panelSvg = pkgs.substituteAll {
    src = ./panel.svg.in;
    inherit (palette) bg;
  };
in
pkgs.stdenvNoCC.mkDerivation {
  pname = "kde-win10";
  version = "1.0";

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/plasma/look-and-feel/mytheme/color-schemes
    mkdir -p $out/share/plasma/look-and-feel/mytheme/plasma/desktoptheme/kde-win10

    cp ${colors} \
      $out/share/plasma/look-and-feel/mytheme/color-schemes/win10.colors

    cp ${panelSvg} \
      $out/share/plasma/look-and-feel/mytheme/plasma/desktoptheme/kde-win10/panel.svg
  '';
}
