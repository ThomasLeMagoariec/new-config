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

        layout = mkOption {
            type = types.submodule {
                options = {
                    gaps = mkOption {
                        type = types.number;
                        default = 8;
                    };
                    center-focused-column = mkOption {
                        type = types.str;
                        default = "never";
                    };
                    preset-column-widths = mkOption {
                        type = types.submodule {
                            options = {
                                proportions = mkOption {
                                    type = types.listOf types.float;
                                    default = [ 0.33333 0.5 0.66667 ];
                                };
                            };
                        };
                        default = {};
                        description = "preset column widths";
                    };
                    default-column-width = mkOption {
                        type = types.submodule {
                            options = {
                                proportion = mkOption {
                                    type = types.float;
                                    default = 0.5;
                                };
                            };
                        };
                        default = {};
                        description = "default column width config";

                    };
                    focus-ring = mkOption {
                        type = types.submodule {
                            options = {
                                off = mkOption {
                                    type = types.bool;
                                    default = false;
                                };
                                width = mkOption {
                                    type = types.number;
                                    default = 4;
                                };
                                active-color = mkOption {
                                    type = types.str;
                                    default = "#7fc8ff";
                                };
                                inactive-color = mkOption {
                                    type = types.str;
                                    default = "#505050";
                                };
                            };
                        };
                        default = {};
                        description = "focus ring config";
                    };
                    border = mkOption {
                        type = types.submodule {
                            options = {
                                off = mkOption {
                                    type = types.bool;
                                    default = true;
                                };
                                width = mkOption {
                                    type = types.number;
                                    default = 4;
                                };
                                active-color = mkOption {
                                    type = types.str;
                                    default = "#ffc87f";
                                };
                                inactive-color = mkOption {
                                    type = types.str;
                                    default = "#505050";
                                };
                                urgent-color = mkOption {
                                    type = types.str;
                                    default = "#9b0000";
                                };
                            };
                        };
                        default = {};
                        description = "border config";
                    };
                    shadow = mkOption {
                        type = types.submodule {
                            options = {
                                on = mkOption {
                                    type = types.bool;
                                    default = false;
                                };
                                draw-behind-window = mkOption {
                                    type = types.bool;
                                    default = false;
                                };
                                softness = mkOption {
                                    type = types.number;
                                    default = 30;
                                };
                                spread = mkOption {
                                    type = types.number;
                                    default = 5;
                                };
                                offset = mkOption {
                                    type = types.str;
                                    default = "x=0 y=5";
                                };
                                color = mkOption {
                                    type = types.str;
                                    default = "#0007";
                                };
                            };
                        };
                        default = {};
                        description = "shadow config";
                    };
                };
            };
            default = {};
            description = "layout config";
        };
        spawn-at-startup = mkOption {
            type = types.listOf types.str;
            default = [];
        };
        hotkey-overlay = mkOption {
            type = types.submodule {
                options = {
                    skip-at-startup = mkOption {
                        type = types.bool;
                        default = false;
                    };
                };
            };
            default = {};
            description = "hotkeys-overlay";
        };
        screenshot-path = mkOption {
            type = types.str;
            default = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
        };
        animations = mkOption {
            type = types.submodule {
                options = {
                    off = mkOption {
                        type = types.bool;
                        default = false;
                    };
                };
            };
            default = {};
            description = "animations config";
        };
        binds = mkOption {
            type = types.listOf types.str;
            default = [];
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

        layout {
            gaps ${toString cfg.layout.gaps}
            center-focused-column ${toString cfg.layout.center-focused-column}

            preset-column-widths {
                ${lib.concatMapStrings (x: "proportion ${toString x}\n}") cfg.layout.preset-column-widths.proportions}
            }

            default-column-width { proportion ${toString cfg.layout.default-column-width.proportion} }

            focus-ring {
                ${if cfg.layout.focus-ring.off then "off" else "// off"}
                active-color ${cfg.layout.focus-ring.active-color}
                inactive-color ${cfg.layout.focus-ring.inactive-color}
            }

            border {
                ${if cfg.layout.border.off then "off" else "// off"}
                width ${toString cfg.layout.border.width}
                active-color ${cfg.layout.border.active-color}
                inactive-color ${cfg.layout.border.inactive-color}
                urgent-color ${cfg.layout.border.urgent-color}
            }

            shadow {
                ${if cfg.layout.shadow.on then "on" else "// on"}
                softness ${toString cfg.layout.shadow.softness}
                spread ${toString cfg.layout.shadow.spread}
                offset ${toString cfg.layout.shadow.offset}
                color ${cfg.layout.shadow.color}
            }
        }

        ${builtins.concatStringsSep "" (
            map (x: "spawn-at-startup \"${x}\"\n") cfg.spawn-at-startup
        )}

        hotkey-overlay {
            ${if cfg.hotkey-overlay.skip-at-startup then "skip-at-startup" else "// skip-at-startup"}
        }

        screenshot-path ${cfg.screenshot-path}

        binds {
            ${builtins.concatStringsSep "" (
                map (x: "${x}\n") cfg.binds
            )}
        }


        '';
    };
}
