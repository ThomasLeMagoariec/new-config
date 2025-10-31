{ config, pkgs, lib, ... }:

with lib;

let
    hypridleOptions = {
        enable = mkOption {
            type = types.bool;
            default = true;
            description = "Whether hypridle should be enabled.";
        };

        idleTimeout = mkOption {
            type = types.int;
            default = 300;
            description = "The time in seconds before going idle (default: 300s)";
        };

        keyboardTimeout = mkOption {
            type = types.int;
            default = 300;
            description = "The time in seconds before turning off the keyboard backlight";
        };

        lockTimeout = mkOption {
            type = types.int;
            default = 300;
            description = "The time in seconds before locking the screen";
        };
   
        screenTimeout = mkOption {
            type = types.int;
            default = 300;
            description = "The time in seconds before the screen turns off";
        };

        suspendTimeout = mkOption {
            type = types.int;
            default = 300;
            description = "The time in seconds before suspending PC";
        };

    };

in

{
    config.home.packages = [ pkgs.hypridle ];

    options = {
        programs.hypridle = {
            enable = mkOption {
                type = types.bool;
                default = true;
                description = "enable or disable hypridle";
            };
            
            idleTimeout = hypridleOptions.idleTimeout;
            keyboardTimeout = hypridleOptions.keyboardTimeout;
            lockTimeout = hypridleOptions.lockTimeout;
            screenTimeout = hypridleOptions.screenTimeout;
            suspendTimeout = hypridleOptions.suspendTimeout;
        };
    };

    config = {
        programs.hypridle.enable = config.programs.hypridle.enable;
        home.file.".config/hypr/hypridle.conf".text = ''
general {
    lock_cmd = pidof hyprlock || hyprlock
    before_sleep_cmd = loginctl lock-session
    after_sleep_cmd = hyprctl dispatch dpms on
}

listener {
    timeout = ${toString config.programs.hypridle.idleTimeout}
    on-timeout = brightnessctl -s set 10
    on-resume = brightnessctl -r
}

listener { 
    timeout = ${toString config.programs.hypridle.keyboardTimeout}
    on-timeout = brightnessctl -sd rgb:kbd_backlight set 0
    on-resume = brightnessctl -rd rgb:kbd_backlight
}

listener {
    timeout = ${toString config.programs.hypridle.lockTimeout}
    on-timeout = loginctl lock-session
}

listener {
    timeout = ${toString config.programs.hypridle.screenTimeout}
    on-timeout = hyprctl dispatch dpms off
    on-resume = hyprctl dispatch dpms on && brightnessctl -r
}

listener {
    timeout = ${toString config.programs.hypridle.suspendTimeout}
    on-timeout = systemctl suspend
}
        '';
    };
    
}
