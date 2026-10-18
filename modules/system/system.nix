{ self, ... }:
{
	flake.nixosModules.system = { ... }:
	let
		modules = with self.nixosModules; [
			bootloader
			networking
			user
			bluetooth
		];
	in {
		imports = modules;
	};
}
