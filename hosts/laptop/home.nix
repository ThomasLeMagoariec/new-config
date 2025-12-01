{ config, pkgs, lib, preferences, ... }:

{
  home.username = preferences.username;
  home.homeDirectory = "/home/"+preferences.username;


  imports = [
	../../hm-modules
  ];


  nixpkgs.config.allowUnfree = true;


  home.packages = [
	pkgs.cbonsai
    pkgs.firefox
    pkgs.meslo-lgs-nf
    pkgs.wofi
    pkgs.chromium
    pkgs.brave
    pkgs.discord
    pkgs.tree
    pkgs.betterdiscordctl
  ];

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
