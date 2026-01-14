{ config, dms, pkgs, lib, preferences, ... }:

{
  home.username = preferences.username;
  home.homeDirectory = "/home/"+preferences.username;


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
