{ config, dms, pkgs, lib, ... }:
let
    prefs = import ../../prefs.nix;
in
{
  home.username = prefs.username;
  home.homeDirectory = "/home/"+prefs.username;


  imports = [
	../../hm-modules
  ];


  nixpkgs.config.allowUnfree = true;


  home.packages = [
    pkgs.firefox
    pkgs.wofi
    pkgs.chromium
    pkgs.brave
    pkgs.discord
    pkgs.betterdiscordctl
  ];

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
