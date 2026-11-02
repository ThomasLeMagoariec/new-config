{ ... }: {
	flake.nixosModules.bootloader = {pkgs, ...}: {
		boot = {
			loader = {
				#systemd-boot.enable = true;
				timeout = 2;
				efi = {
					canTouchEfiVariables = true;
				};
				grub = {
					enable = true;
					efiSupport = true;
					device = "nodev";
				};
			};

			kernelPackages = pkgs.linuxPackages_latest;
		};
	};
}
