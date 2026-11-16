{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.keyboard = moduleWithSystem ({ self', ... }: { pkgs, ... }:
	{
		environment.systemPackages = [
			pkgs.vial
		];
		services.udev.extraRules = ''
# Vial/VIA keyboards
	  SUBSYSTEM=="usb", ATTRS{idVendor}=="4653", MODE="0666"
	  SUBSYSTEM=="hidraw", ATTRS{idVendor}=="4653", MODE="0666"
		'';
			services.udev.packages = [ pkgs.vial ];
	programs.nix-ld = {
				enable = true;
				libraries = with pkgs; [
					libGL
					libxcb
				];
			};
	});
	
}
