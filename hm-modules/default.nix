{ config, lib, pkgs, preferences, ... }:

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
        ./sops.nix
        ./ssh.nix
	] ++ lib.optionals (preferences.shell == "zsh") [ ./zsh.nix ]
      ++ lib.optionals (preferences.wm == "hyprland" &&
                        preferences.dms == false) [ ./hypr.nix ]
      ++ lib.optionals (preferences.dms == true) [ ./dms.nix ./dsearch.nix ]
      ++ lib.optionals (preferences.misc == true) [ ./misc.nix ];

}

