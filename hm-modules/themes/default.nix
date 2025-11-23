{ config, lib, pkgs, host ... }:

{
	imports = [
        ../../global/preferences.nix
	] ++ lib.optionals (preferences == "catppuccin") [ ./catppuccin ];

}

