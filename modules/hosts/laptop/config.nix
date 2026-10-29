{ ... }:
{
	flake.nixosModules.laptopConfig = { pkgs, ... }:
	let
		vmSettings = { lib, ... }: {
		virtualisation = {
			memorySize = 4096;
			cores = 2;
			qemu.options = [ "-device virtio-vga-gl" "-display gtk,gl=on" ];
		};
	};
	in
	{
		imports = [
			./_hardware.nix
		];

		environment.systemPackages = with pkgs; [
			git
			vim
			font-awesome
		];
		
		services.xserver.enable = true;
		services.displayManager.sddm = {
			enable = true;
			wayland.enable = true;
			theme = "catppuccin-mocha-mauve";
		};

		# only applies to `nixos-rebuild build-vm`, not the real laptop
		virtualisation.vmVariant = vmSettings;
		virtualisation.vmVariantWithBootLoader = vmSettings;

		system.stateVersion = "26.05";
	};
}
