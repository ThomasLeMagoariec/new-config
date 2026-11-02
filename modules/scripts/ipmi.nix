{ inputs, moduleWithSystem, self', ... }:
{
	flake.nixosModules.ipmi-tg = moduleWithSystem ({ self', ... }: {
		environment.systemPackages = [
			self'.packages.ipmi-tg
		];
	});

	perSystem = { lib, pkgs, ... }:
	let
		script = ''
			set -e
			${lib.getExe pkgs.ipmitool} -I lanplus -H $1 -U root -P calvin raw 0x30 0x30 0x01 0x00
			${lib.getExe pkgs.ipmitool} -I lanplus -H $1 -U root -P calvin raw 0x30 0x30 0x02 0xff 0x$(printf "%x" $2)
		'';
	in {
		packages.ipmi-tg = inputs.wrappers.lib.wrapPackage {
			inherit pkgs;
			package = pkgs.writeShellScriptBin "ipmi-tg" script;
			binName = "ipmi-tg";
		};
	};
}

