{ lib, ... }:
let
    prefs = import ../prefs.nix;
in 
{
	imports = [
        ./kb.nix
        ./sops.nix
        ./yubi.nix
        ./boot.nix
        ./networking.nix
     ]
      ++ lib.optionals (prefs.kde) [ ./kde.nix]
      ++ lib.optionals (prefs.laptop == true) [ ./upower.nix ];
    

    nixpkgs.config.allowUnfree = true;
}

