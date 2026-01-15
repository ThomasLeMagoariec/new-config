{ config, lib, preferences, ... }:

{
	imports = [
        ./kb.nix
        ./bluetooth.nix
        ./sops.nix
        ./devenv.nix
	] ++ lib.optionals (preferences.openssh == true) [ ./openssh.nix ];
    

    nixpkgs.config.allowUnfree = true;
}

