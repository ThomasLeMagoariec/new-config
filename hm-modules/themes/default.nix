{ config, lib, pkgs, host, preferences, ... }:

{
	imports = [
	] ++ lib.optionals (preferences.theme == "catppuccin") [ ./catppuccin ]
      ++ lib.optionals (preferences.theme == "rose-pine") [ ./rose-pine ];

}

