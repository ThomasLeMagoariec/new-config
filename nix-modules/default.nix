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
	] ++ lib.optionals (prefs.openssh == true) [ ./openssh.nix ]
      ++ lib.optionals (prefs.laptop == true) [ ./upower.nix ];
    

    nixpkgs.config.allowUnfree = true;
}

