{

	description = "Flake Config";

	inputs = {
		nixpkgs.url =  "nixpkgs/nixos-25.05";
		nixpkgs-unstable.url =  "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim.url = "github:nix-community/nixvim";
	};


	outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nixvim, ... }:
	let
        preferences = {
            name = "Thomas";
            username = "thomas";
            theme = "catppuccin";
            shell = "zsh";
        }; 
		lib = nixpkgs.lib;
        pkgs-unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
	in {
		nixosConfigurations = {
			laptop = lib.nixosSystem {
				system = "x86_64-linux";
				modules = [ ./hosts/laptop/configuration.nix ];
                specialArgs = { inherit pkgs-unstable; };
			};
		};
		homeConfigurations.thomas = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
			modules = [
				nixvim.homeModules.nixvim
				./hosts/laptop/home.nix
			];
            extraSpecialArgs = {
                inherit preferences;
            };
		};
	};
}
