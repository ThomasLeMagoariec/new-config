{ config, pkgs, lib, ... }:

with lib;

let
    hyprpaperOptions = {
        enable = mkOption {
            type = types.bool;
            default = true;
            description = "Whether hyprpaper should be enabled.";
        };

        wallpaper = mkOption {
            type = types.path;
            description = "wallpaper location";
        };
    };

in

{
    config.home.packages = [ pkgs.hyprpaper ];

    options = {
        programs.hyprpaper = {
            enable = mkOption {
                type = types.bool;
                default = true;
                description = "enable or disable hyprpaper";
            };
            
            wallpaper = hyprpaperOptions.wallpaper;
        };
    };

    config = {
        programs.hyprpaper.enable = config.programs.hyprpaper.enable;
        home.file.".config/hypr/hyprpaper.conf".text = ''
preload = ~/.config/hypr/wallpaper.jpg
wallpaper = , ~/.config/hypr/wallpaper.jpg
        '';
        ".config/hypr/wallpaper.jpg".source = config.programs.hyprpaper.wallpaper;
    };
    
}
