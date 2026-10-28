{ self, inputs, ... }:
{
	flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
		modules = with self.nixosModules; [
			laptopConfig
			system
			zsh
			niri
			noctalia
			hyprlock
			fuzzel
			kitty
		];
	};
}
