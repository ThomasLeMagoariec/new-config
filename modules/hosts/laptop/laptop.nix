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
			swayidle
			fuzzel
			kitty
			firefox
			tmux
			neovim
			discord
			sddm
			waybar
		];
	};
}
