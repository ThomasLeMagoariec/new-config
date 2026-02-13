{ lib, ... }:
let
    prefs = import ../prefs.nix;
in 
{
	imports = [
        ./kb.nix
        ./bluetooth.nix
        ./sops.nix
        ./yubi.nix
        ./upower.nix
	] ++ lib.optionals (prefs.openssh == true) [ ./openssh.nix ]
      ++ lib.optionals (prefs.dms == true) [ ./upower.nix ];
    

    nixpkgs.config.allowUnfree = true;
}

