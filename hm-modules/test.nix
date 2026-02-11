{lib, pkgs, ...}:
let
    hasPrefs = builtins.pathExists ../prefs.nix;
    prefs = if hasPrefs then import ../prefs.nix else {};
in
    pkgs.writeShellApplication {
        name = "bite";
        text = ''
            echo value from prefs: 
        '';
    }
