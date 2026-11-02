{ self, ... }:
{
	flake.nixosModules.scripts = { ... }:
	let
		modules = with self.nixosModules; [
			ipmi
		];
	in {
		imports = modules;
	};
}
