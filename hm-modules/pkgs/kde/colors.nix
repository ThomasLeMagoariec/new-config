# colors.nix
{ pkgs, palette }:

pkgs.replaceVars ./win10.colors.in {
  bg     = palette.bg;
  fg     = palette.fg;
  accent = palette.accent;
  #red    = palette.red;
  #green  = palette.green;
  #yellow = palette.yellow;
}
