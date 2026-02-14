{ lib, ... }:
let
    prefs = import ../../prefs.nix
in
{
    imports = [
        (lib.mkIf (prefs.os == true) [ ./os.nix ])
        ./languages.nix
        ./tools.nix
    ];
}
