{ inputs, moduleWithSystem, lib, ... }:
{
	flake.nixosModules.fuzzel = moduleWithSystem ({ pkgs, self', ... }: {
		environment.systemPackages = [
			self'.packages.fuzzel
			pkgs.papirus-icon-theme
			(pkgs.makeDesktopItem {
				name = "fuzzel";
				icon = "fuzzel";
				desktopName = "Fuzzel";
				exec = lib.getExe self'.packages.fuzzel;
			})
		];
	});
	perSystem = { pkgs, lib, ... }: {
		packages.fuzzel = inputs.wrappers.wrappers.fuzzel.wrap {
			inherit pkgs;
			flags = {
				"--config" = lib.mkForce ./config.ini;
			};
		};
	};
}
