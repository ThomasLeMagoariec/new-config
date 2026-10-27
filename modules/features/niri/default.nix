{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.niri = moduleWithSystem ({ pkgs, self', ... }: {
		programs.niri = {
			enable = true;
			package = self'.packages.niri;
		};
		environment.systemPackages = with pkgs; [
			awww
		];
	});
	perSystem = { pkgs, self', lib, ... }: {
		packages.niri = inputs.wrappers.wrappers.niri.wrap {
			inherit pkgs;
			settings = {
				screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
				prefer-no-csd = _: { };
				xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

				spawn-at-startup = [
					"${lib.getExe pkgs.kitty}"
					"${pkgs.awww}/bin/awww-daemon"
				];
				
				spawn-sh-at-startup = [
					"awww img ${./. + "/wallpapers/wall-001.jpg"}"
				];

				binds = {
					"Mod+Return".spawn = lib.getExe pkgs.kitty;
					"Mod+L".spawn = [ "${lib.getExe self'.packages.hyprlock}"];
					"Mod+D".spawn = [ "${lib.getExe self'.packages.fuzzel}"];
				};
			};
			extraSettings = [
				{ include = ./kb.kdl; }
				{ include = ./binds.kdl; }
			];
		};
	};
}
