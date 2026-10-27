{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.niri = moduleWithSystem ({ pkgs, self', ... }: {
		programs.niri = {
			enable = true;
			package = self'.packages.niri;
		};
	});
	perSystem = { pkgs, self', lib, ... }: {
		packages.niri = inputs.wrappers.wrappers.niri.wrap {
			inherit pkgs;
			settings = {
				xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
				spawn-at-startup = [
					"${lib.getExe self'.packages.noctalia}"
					"${lib.getExe pkgs.kitty}"
				];
				binds = {
					"Mod+Return".spawn = lib.getExe pkgs.kitty;
					"Mod+D".spawn-sh = "${lib.getExe self'.packages.noctalia} ipc call launcher toggle";
					"Mod+Q".close-window = _: { };
					"Mod+Shift+E".quit = _: { };
					"Mod+Left".focus-column-left = _: { };
					"Mod+Right".focus-column-right = _: { };
					"Mod+Up".focus-window-up = _: { };
					"Mod+Down".focus-window-down = _: { };
					"Mod+Shift+Left".move-column-left = _: { };
					"Mod+Shift+Right".move-column-right = _: { };
					"Mod+F".maximize-column = _: { };
					"Mod+Shift+Slash".show-hotkey-overlay = _: { };
				};
			};
		};
	};
}
