{ config, pkgs, lib, ... }:

with lib;

let
    userPrefsOptions = {
        wm = mkOption {
            type = types.str;
            default = "hyprland";
            description = "which WM to use";
        };

        theme = mkOption {
            type = types.str;
            default = "catppuccin";
            description = "which theme to use";
        };

        shell = mkOption {
            type = types.str;
            default = "catppuccin";
            description = "which shell to use";
        };
    };

in

{
    options = {
        userPrefs = {
            wm = userPrefsOptions.wm;
            theme = userPrefsOptions.theme;
        };
    };
}
