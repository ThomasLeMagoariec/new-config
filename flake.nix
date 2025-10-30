{

	description = "Flake Config";

	inputs = {
		nixpkgs.url =  "nixpkgs/nixos-25.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixvim.url = "github:nix-community/nixvim";
	};


	outputs = { self, nixpkgs, home-manager, nixvim, ... }:
	let
		lib = nixpkgs.lib;
	in {
		nixosConfigurations = {
			laptop = lib.nixosSystem {
				system = "x86_64-linux";
				modules = [ ./hosts/laptop/configuration.nix ];
			};
		};
		homeConfigurations.thomas = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
			modules = [
				nixvim.homeModules.nixvim
				./hosts/laptop/home.nix
			];
		};
	};
}
