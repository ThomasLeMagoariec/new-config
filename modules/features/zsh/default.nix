{ inputs, ... }:
{
	perSystem = { pkgs, ... }: {
		packages.zsh = inputs.wrappers.wrappers.zsh.wrap {
			inherit pkgs;
			zshAliases = {
				some = "nvim";
			};
		};
	};
}
