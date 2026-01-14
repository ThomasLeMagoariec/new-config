{ config, lib, preferences, ... }:

{
	imports = [
        ./kb.nix
        ./bluetooth.nix
        ./sops.nix
	] ++ lib.optionals (preferences.openssh == true) [ ./openssh.nix ]
      ++ lib.optionals (preferences.dms == true) [ ./dms.nix ];
    

    nixpkgs.config.allowUnfree = true;
}

