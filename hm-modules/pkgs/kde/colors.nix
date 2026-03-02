# colors.nix
{ pkgs, palette }:

pkgs.substituteAll {
  src = ./win10.colors.in;
  inherit (palette)
    bg
    fg
    accent
    red
    green
    yellow;
}
