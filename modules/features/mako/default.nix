{ inputs, moduleWithSystem, lib, ... }:
{
	flake.nixosModules.mako = moduleWithSystem ({ pkgs, self', ... }: {
		environment.systemPackages = [
			self'.packages.mako
		];
		# clean sans-serif, closest free match to Apple's SF Pro
		fonts.packages = [ pkgs.inter ];
	});
	perSystem = { pkgs, lib, ... }: {
		packages.mako = inputs.wrappers.wrappers.mako.wrap {
			inherit pkgs;
			# Catppuccin Macchiato, styled after macOS notification banners
			settings = {
				# placement: top-right, floating above everything
				icon-path = "${pkgs.papirus-icon-theme}/share/icons/Papirus-Dark";
				anchor = "top-right";
				layer = "overlay";
				outer-margin = 12;
				margin = 8; # gap between stacked notifications
				max-visible = 4;
				sort = "-time";

				# card shape
				width = 360;
				height = 140;
				padding = "14,16";
				border-size = 1;
				border-radius = 16;

				# colours (#RRGGBBAA: slight transparency like macOS)
				background-color = "#24273aeb"; # base
				text-color = "#cad3f5"; # text
				border-color = "#494d64"; # surface1, a hairline instead of a loud border
				progress-color = "over #c6a0f633"; # mauve, tinted

				# text
				font = "Inter 11";
				markup = true;
				format = "<b>%s</b>\\n<span color='#b8c0e0'>%b</span>";
				text-alignment = "left";

				# app icon on the left, rounded like an app icon
				icons = true;
				icon-location = "left";
				max-icon-size = 40;
				icon-border-radius = 10;

				default-timeout = 5000;
				group-by = "app-name";

				"urgency=low" = {
					text-color = "#a5adcb"; # subtext0
				};
				"urgency=high" = {
					border-color = "#f5a97f"; # peach
					default-timeout = 0; # stays until dismissed
				};
				# when several notifications from one app are grouped
				"grouped" = {
					format = "<b>%s</b> <span color='#a5adcb'>(%g)</span>\\n<span color='#b8c0e0'>%b</span>";
				};
				# `makoctl mode -t do-not-disturb` to silence everything
				"mode=do-not-disturb" = {
					invisible = 1;
				};
			};
		};
	};
}
