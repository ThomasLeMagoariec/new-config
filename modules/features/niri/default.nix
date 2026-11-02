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
					"XF86AudioRaiseVolume" = _: {
						props.allow-when-locked = true;
						content.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
					};
					"XF86AudioLowerVolume" = _: {
						props.allow-when-locked = true;
						content.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
					};
					"XF86AudioMute" = _: {
						props.allow-when-locked = true;
						content.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
					};
					"XF86AudioMicMute" = _: {
						props.allow-when-locked = true;
						content.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
					};
					"XF86MonBrightnessUp" = _: {
						props.allow-when-locked = true;
						content.spawn = [ "${lib.getExe pkgs.brightnessctl}" "--class=backlight" "set" "+10%" ];
					};
					"XF86MonBrightnessDown" = _: {
						props.allow-when-locked = true;
						content.spawn = [ "${lib.getExe pkgs.brightnessctl}" "--class=backlight" "set" "10%-" ];
					};
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
					{
						matches = [ {app-id = "^libreoffice-writer$"; } ];
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
