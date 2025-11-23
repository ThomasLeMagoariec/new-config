{ config, pkgs, lib, name, ... }:

{
  home.username = "thomas";
  home.homeDirectory = "/home/thomas";

  preferences = {
    wm = "i3";
    theme = "catppuccin";
    shell = "zsh";
  };

  imports = [
    ../../global/preferences.nix
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
  ] ++ lib.optionals (config.userPrefs.wm == "i3") [ pkgs.lolcat ];

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
