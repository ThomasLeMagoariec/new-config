{ lib, ... }:
let
    prefs = import ../../prefs.nix;
in
{
    imports = [
        ./languages.nix
        ./tools.nix
    ]
    ++ lib.optionals (prefs.os) [ ./os.nix ];
}
