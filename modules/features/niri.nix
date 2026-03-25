{ self, inputs, ... }: {
    flake.nixosModules.niri = { pkgs, lib, ...}: {
        programs.niri = {
            enable = true;
            package = self.packages.${pkgs.stdenv.hostPlatform.system}.my-niri;
        };
    };

    perSystem = { pkgs, lib, self', ... }: {
        packages.my-niri = inputs.wrapper-modules.wrappers.niri.wrap {
            inherit pkgs;
            settings = {
                spawn-at-startup = [
                    { command = [ (lib.getExe pkgs.dms) ]; }
                ];
                xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
                input.keyboard.xkb.layout = "fr,fr"

                binds = {
                    "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;
                    "Mod+Q".close-window = null;
                    "Mod+D" = { spawn = [ "dms" "ipc" "call" "spotlight" "toggle" ]; };
                };
            };
        };
    }
}
