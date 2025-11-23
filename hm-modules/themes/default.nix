{ config, lib, pkgs, host, ... }:

{
	imports = [
	] ++ lib.optionals (preferences == "catppuccin") [ ./catppuccin ];

}

