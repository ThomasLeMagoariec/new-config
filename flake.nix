{

	description = "Flake Config";

	inputs = {
		nixpkgs.url =  "nixpkgs/nixos-25.05";
	};


	outputs = { self, nixpkgs, ... }:
	let
		lib = nixpkgs.lib;
	in {
		nixosConfigurations = {
			laptop = lib.nixosSystem {
				system = "x86_64-linux";
				modules = [ ./hosts/laptop/configuration.nix ];
			}
		};
	};
}
