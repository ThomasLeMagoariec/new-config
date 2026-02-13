{ config, pkgs, lib, ... }:

with lib;

let
cfg = config.programs.niri;
in
{
    options.programs.niri = {
        enable = mkEnableOption "niri";

        spawnAtStart = mkOption {
            type = types.listOf types.str;
            default = [];
            description = "Services to be spawned when niri starts";
        };

        preferNoCSD = mkOption {
            type = types.bool;
            default = true;
            description = "Whether or not to disable CSD";
        };

        input = mkOption {
            type = types.submodule {
                options = {
                    keyboard = mkOption {
                        type = types.submodule {
                            options = {
                                xkb = mkOption {
                                    type = types.submodule {
                                        options = {
                                            layout = mkOption {
                                                type = types.str;
                                                default = "us";
                                                description = "keyboard layout";
                                            };
                                        };
                                    };
                                    default = {};
                                };
                                numlock = mkOption {
                                    type = types.bool;
                                    default = true;
                                    description = "enable numlock";
                                };
                            };
                        };
                        default = {};
                    };
                    touchpad = mkOption {
                        type = types.submodule {
                            options = {
                                off = mkOption {
                                    type = types.bool;
                                    default = false;
                                    description = "disable touchpad";
                                };
                                tap = mkOption {
                                    type = types.bool;
                                    default = true;
                                };
                                dwt = mkOption {
                                    type = types.bool;
                                    default = false;
                                };
                                dwtp = mkOption {
                                    type = types.bool;
                                    default = false;
                                };
                                drag = mkOption {
                                    type = types.bool;
                                    default = false;
                                };
                                drag-lock = mkOption {
                                    type = types.bool;
                                    default = false;
                                };
                                natural-scroll = mkOption {
                                    type = types.bool;
                                    default = true;
                                };
                                accel-speed = mkOption {
                                    type = types.float;
                                    default = 0;
                                };
                                accel-profile = mkOption {
                                    type = types.str;
                                    default = "flat";
                                };
                                scroll-method = mkOption {
                                    type = types.str;
                                    default = "two-finger";
                                };
                                disabled-on-external-mouse = mkOption {
                                    type = types.bool;
                                    default = false;
                                };
                            };
                        };
                        default = {};
                        description = "touchpad config";
                    };
                    mouse = mkOption {
                        type = types.submodule {
                            options = {
                                off = mkOption {
                                    type = types.bool;
                                    default = false;
                                };
                                natural-scroll = mkOption {
                                    type = types.bool;
                                    default = false;
                                };
                                accel-speed = mkOption {
                                    type = types.float;
                                    default = 0.0;
                                };
                                accel-profile = mkOption {
                                    type = types.str;
                                    default = "flat";
                                };
                                scroll-method = mkOption {
                                    type = types.str;
                                    default = "no-scroll";
                                };
                            };
                        };
                        default = {};
                        description = "mouse config";
                    };
                    trackpoint = mkOption {
                        type = types.submodule {
                            options = {
                                off = mkOption {
                                    type = types.bool;
                                    default = false;
                                };
                                natural-scroll = mkOption {
                                    type = types.bool;
                                    default = false;
                                };
                                accel-speed = mkOption {
                                    type = types.float;
                                    default = 0.0;
                                };
                                accel-profile = mkOption {
                                    type = types.str;
                                    default = "flat";
                                };
                                scroll-method = mkOption {
                                    type = types.str;
                                    default = "on-button-down";
                                };
                                scroll-button = mkOption {
                                    type = types.int;
                                    default = 273;
                                };
                                scroll-button-lock = mkOption {
                                    type = types.bool;
                                    default = false;
                                };
                                middle-emulation = mkOption {
                                    type = types.bool;
                                    default = false;
                                };
                            };
                        };
                        default = {};
                        description = "trackpoint config";
                    };
                };
            };
            default = {};
            description = "input section of the niri config";
        };
    };

    config = mkIf cfg.enable {
        home.packages = [ pkgs.niri ];

        home.file."niriTEST.conf".text = ''

            ${if cfg.preferNoCSD then "prefer-no-csd" else ""}

        input {
            keyboard {
                xkb {
                    layout "${cfg.input.keyboard.xkb.layout}"
                }
                ${if cfg.input.keyboard.numlock then "numlock" else ""}
            }

            touchpad {
                ${if cfg.input.touchpad.off then "off" else ""}
                ${if cfg.input.touchpad.tap then "tap" else ""}
                ${if cfg.input.touchpad.dwt then "dwt" else ""}
                ${if cfg.input.touchpad.dwtp then "dwtp" else ""}
                ${if cfg.input.touchpad.drag then "drag true" else ""}
                ${if cfg.input.touchpad.drag-lock then "drag-lock" else ""}
                ${if cfg.input.touchpad.natural-scroll then "natural-scroll" else ""}
                accel-speed ${toString cfg.input.touchpad.accel-speed}
                accel-profile ${cfg.input.touchpad.accel-profile}
                scroll-method ${cfg.input.touchpad.scroll-method}
                ${if cfg.input.touchpad.disabled-on-external-mouse then "disabled-on-external-mouse" else ""}
            }

            mouse {
                ${if cfg.input.mouse.off then "off" else ""}
                ${if cfg.input.mouse.natural-scroll then "natural-scroll" else ""}
                accel-speed ${toString cfg.input.mouse.accel-speed}
                accel-profile ${toString cfg.input.mouse.accel-profile}
                scroll-method ${toString cfg.input.mouse.scroll-method}
            }

            trackpoint {
                ${if cfg.input.trackpoint.off then "off" else ""}
                ${if cfg.input.trackpoint.natural-scroll then "natural-scroll" else ""}
                accel-speed ${toString cfg.input.trackpoint.accel-speed}
                accel-profile ${toString cfg.input.trackpoint.accel-profile}
                scroll-method ${toString cfg.input.trackpoint.scroll-method}
                scroll-button ${cfg.input.trackpoint.scroll-method}
                ${if cfg.input.trackpoint.scroll-button-lock then "scroll-button-lock" else ""}
                ${if cfg.input.trackpoint.middle-emulation then "middle-emulation" else ""}

            }

        }

        '';
    };
}
