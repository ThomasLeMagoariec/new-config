{ config, lib, preferences, ... }:

{
	imports = [
        ./kb.nix
        ./bluetooth.nix
        ./sops.nix
	] ++ lib.optionals (preferences.openssh == true) [ ./openssh.nix ]
    

    nixpkgs.config.allowUnfree = true;
}

