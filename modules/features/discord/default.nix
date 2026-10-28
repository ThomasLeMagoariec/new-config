{ inputs, moduleWithSystem, lib, ... }:
{
	flake.nixosModules.discord = moduleWithSystem ({ pkgs, self', ... }: {
		environment.systemPackages = [
			self'.packages.vesktop
		];
	});

	perSystem = { pkgs, ... }: 
	let
		copySettings = pkgs.writeShellScript "vesktop-settings" ''
			dir="''${XDG_CONFIG_HOME:-$HOME/.config}/vesktop"
			[ -e "$dir/settings.json" ] || install -Dm644 ${./settings.json} "$dir/settings.json"
			[ -e "$dir/settings/settings.json" ] || install -Dm644 ${./vencord.json} "$dir/settings/settings.json"
			[ -e "$dir/themes/catppuccin.css" ] || install -Dm644 ${ ./themes/catppuccin.css } "$dir/themes/catppuccin.css"
		'';
	in {
		packages.vesktop = inputs.wrappers.lib.wrapPackage {
			inherit pkgs;
			package = pkgs.vesktop;
			runShell = [ "${copySettings}" ];
			flags = {
				"--ozone-platform-hint" = "auto";
			};
		};
		
	};
}
