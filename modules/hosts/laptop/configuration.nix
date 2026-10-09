{ inputs, self, ... }:
{
	flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
		modules = [
			self.nixosModules.laptop
		];
	};

	flake.nixosModules.laptop = {
		boot.loader.grub.enable = true;
	};
}
