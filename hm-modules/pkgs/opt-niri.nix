{ config, pkgs, lib, ... }:

with lib;

let
    niriOptions = {
        enable = mkOption {
            type = types.bool;
            default = true;
            description = "Whether niri should be enabled.";
        };

        idleTimeout = mkOption {
            type = types.int;
            default = 300;
            description = "The time in seconds before going idle (default: 300s)";
        };

    };

in

{
    config.home.packages = [ pkgs.niri ];

    options = {
        programs.niri = {
            enable = mkOption {
                type = types.bool;
                default = true;
                description = "enable or disable niri";
            };
            
            idleTimeout = niriOptions.idleTimeout;
        };
    };

    config = {
        programs.niri.enable = config.programs.niri.enable;
        home.file."niriTEST.conf".text = ''

Test file!!

Test value:${toString config.programs.niri.idleTimeout}

        '';
    };
    
}
