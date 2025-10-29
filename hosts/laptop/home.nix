{ config, pkgs, ... }:

{
  home.username = "thomas";
  home.homeDirectory = "/home/thomas";

  home.packages = [
	pkgs.cbonsai
  ];

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
