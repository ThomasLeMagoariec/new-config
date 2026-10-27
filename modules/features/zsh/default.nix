{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.zsh = moduleWithSystem ({ pkgs, self', ... }: {
		programs.zsh = {
			enable = true;
			package = self'.packages.zsh;
		};
	});
	perSystem = { pkgs, lib, ... }: {
		packages.zsh = inputs.wrappers.wrappers.zsh.wrap {
			inherit pkgs;
			zshAliases = {
				some = "nvim";
				ff = lib.getExe pkgs.fastfetch;
			};
		};
	};
}
