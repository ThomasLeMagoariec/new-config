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
					"${pkgs.awww}/bin/awww-daemon"
					"${lib.getExe self'.packages.mako}"
					"${lib.getExe self'.packages.swayidle}"
				];
				
				spawn-sh-at-startup = [
					"awww img ${./. + "/wallpapers/wall-001.jpg"}"
				];

				binds = {
					"Mod+Return".spawn = lib.getExe self'.packages.kitty;
					"Mod+L".spawn = [ "${lib.getExe self'.packages.hyprlock}"];
					"Mod+D".spawn = [ "${lib.getExe self'.packages.fuzzel}"];
				};
				
				window-rules = [
					{ opacity = 0.8; }
					{ draw-border-with-background = false; }
					{
						matches = [
							{ title = "kitty"; }
						];
						opacity = 0.8;
					}
					{
						matches = [
							{ title = "Mozilla Firefox"; }
							{ app-id = "firefox"; }
						];
						opacity = 0.8;
					}
					{
						matches = [ {app-id = "^vesktop$"; } ];
						opacity = 0.95;
					}
				];
			};
			extraSettings = [
				{ include = ./kb.kdl; }
				{ include = ./binds.kdl; }
			];
		};
	};
}
