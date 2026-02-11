{lib, pkgs, ...}:
let
    prefs =
        if builtins.pathExists ../prefs.nix 
        then import ../prefs.nix
        else {}
in
    pkgs.writeShellApplication {
        name = "bite";
        text = ''
            echo value from prefs: ${prefs.bite}
        '';
    }
