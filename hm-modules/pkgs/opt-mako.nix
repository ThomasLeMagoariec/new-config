{ config, pkgs, lib, ... }:

with lib;

let
    makoOptions = {
        enable = mkOption {
            type = types.bool;
            default = true;
            description = "Whether mako should be enabled.";
        };

        defaultTimeout = mkOption {
            type = types.int;
            default = 5000;
            description = "Time in ms after which notification disappears";
        };

        font = mkOption {
            type = types.str;
            default = "monospace 12";
            description = "Font & size for notifications";
        };

        backgroundColor = mkOption {
            type = types.str;
            default = "#ffffff";
            description = "Background color";
        };

        borderColor = mkOption {
            type = types.str;
            default = "#000000";
            description = "Border color";
        };


        borderRadius = mkOption {
            type = types.int;
            default = 10;
            description = "Border radius";
        };
    };

in

{
    config.home.packages = [ pkgs.mako ];

    options = {
        programs.mako = {
            enable = mkOption {
                type = types.bool;
                default = true;
                description = "enable or disable mako";
            };
            
            defaultTimeout = makoOptions.defaultTimeout;
            font = makoOptions.font;
            backgroundColor = makoOptions.backgroundColor;
            borderColor = makoOptions.borderColor;
            borderRadius = makoOptions.borderRadius;
        };
    };

    config = {
        programs.mako.enable = config.programs.mako.enable;
        home.file.".config/mako/config".text = ''
default-timeout=${toString config.programs.mako.defaultTimeout}
font=${config.programs.mako.font}
background-color=${config.programs.mako.backgroundColor}
border-color=${config.programs.mako.borderColor}
border-radius=${toString config.programs.mako.borderRadius}
        '';
    };
    
}
