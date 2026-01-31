{

	description = "Flake Config";

	inputs = {
		nixpkgs.url =  "nixpkgs/nixos-25.11";
		nixpkgs-unstable.url =  "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

        my-pkgs = {
            url = "github:ThomasLeMagoariec/my-pkgs";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        dms = {
            url = "github:AvengeMedia/DankMaterialShell";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        danksearch = {
            url = "github:AvengeMedia/danksearch";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        sops-nix.url = "github:Mic92/sops-nix";

		nixvim.url = "github:nix-community/nixvim/nixos-25.11";
	};


	outputs = { self, nixpkgs, nixpkgs-unstable, dms, danksearch, home-manager, my-pkgs, nixvim, ... }@inputs:
	let
        preferences = {
            name = "Thomas";
            username = "thomas";
            theme = "catppuccin";
            shell = "zsh";
            wm = "hyprland";
            dms = true;
            editor = "nvim";
            openssh = false;
            misc = true;
        }; 
		lib = nixpkgs.lib;
        pkgs-unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
	in {
		nixosConfigurations = {
			laptop = lib.nixosSystem {
				system = "x86_64-linux";
				modules = [ ./hosts/laptop/configuration.nix ];
                specialArgs = {
                    inherit preferences;
                    inherit pkgs-unstable;
                    inherit inputs;
                };
			};
			chanek = lib.nixosSystem {
				system = "x86_64-linux";
				modules = [ ./hosts/chanek/configuration.nix ];
                specialArgs = {
                    inherit preferences;
                    inherit pkgs-unstable;
                    inherit inputs;
                };
			};
		};
		homeConfigurations = {
            thomas = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.x86_64-linux;
                modules = [
                    nixvim.homeModules.nixvim
                    ./hosts/laptop/home.nix
                ];
                extraSpecialArgs = {
                    inherit preferences;
                    inherit inputs;
                    inherit dms;
                    inherit my-pkgs;
                    inherit pkgs-unstable;
                };
            };

            chanek = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.x86_64-linux;
                modules = [
                    nixvim.homeModules.nixvim
                        ./hosts/chanek/home.nix
                ];
                extraSpecialArgs = {
                    inherit preferences;
                    inherit inputs;
                };
            };
		};
	};
}
