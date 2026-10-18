{ self, inputs, ... }:
{
	flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
		modules = with self.nixosModules; [
			system
			user
			bootloader
			networking
		];
	};
}
