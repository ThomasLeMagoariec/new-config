{ config, lib, pkgs, host, preferences, ... }:

{
	imports = [
	] ++ lib.optionals (preferences.theme == "catppuccin") [ ./catppuccin ];

}

