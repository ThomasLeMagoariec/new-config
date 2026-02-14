{ lib, ... }:
let
    prefs = import ../prefs.nix;
in
{
	imports = [
        ./dotfiles.nix
        ./mako.nix
        ./yazi.nix
        ./utils.nix
        ./sops.nix
        ./ssh.nix
        ./nixmate.nix
	] ++ lib.optionals (prefs.shell == "zsh") [ ./zsh.nix ]
      ++ lib.optionals (prefs.dms == true) [ ./dms.nix ./dsearch.nix ]
      ++ lib.optionals (prefs.misc == true) [ ./misc.nix ]
      ++ lib.optionals (prefs.editor == "nvim") [ ./nixvim ]
      ++ lib.optionals (prefs.office) [ ./graphical.nix ]
      ++ lib.optionals (prefs.ssh) [ ./ssh.nix ]
      ++ lib.optionals (prefs.wm == "niri") [ ./niri.nix ]
      ++ lib.optionals (prefs.dev) [ ./dev ]
      ++ lib.optionals (prefs.wm == "hyprland" &&
                        prefs.dms == false) [ ./hypr.nix ];

}

