{ config, pkgs, ... }:

{
  home.username = "thomas";
  home.homeDirectory = "/home/thomas";

  imports = [
	../../hm-modules
  ];

  home.packages = [
	pkgs.cbonsai
    pkgs.firefox
    pkgs.meslo-lgs-nf
    pkgs.wofi
  ];

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
