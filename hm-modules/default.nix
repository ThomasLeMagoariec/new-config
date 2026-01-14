{ config, lib, pkgs, host, preferences, ... }:

{
	imports = [
        ./themes
		./nixvim
        ./dotfiles.nix
        ./mako.nix
        ./dev.nix
        ./yazi.nix
        ./utils.nix
        ./graphical.nix
        ./niri.nix
#        ./sops.nix
	] ++ lib.optionals (preferences.shell == "zsh") [ ./zsh.nix ]
      ++ lib.optionals (preferences.wm == "hyprland") [ ./hypr.nix ]
      ++ lib.optionals (preferences.misc == true) [ ./misc.nix ];

}

