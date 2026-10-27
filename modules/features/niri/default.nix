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
				screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
				prefer-no-csd = _: { };
				xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

				spawn-at-startup = [
					"${lib.getExe self'.packages.noctalia}"
					"${lib.getExe pkgs.kitty}"
				];

				binds = {
					"Mod+Return".spawn = lib.getExe pkgs.kitty;
					"Mod+D".spawn = [ "${lib.getExe self'.packages.noctalia}" "msg" "panel-toggle" "launcher" ];
					"Mod+L".spawn = [ "${lib.getExe self'.packages.noctalia}" "msg" "session" "lock" ];
				};
			};
			extraSettings = [
				{ include = ./kb.kdl; }
				{ include = ./binds.kdl; }
			];
		};
	};
}
