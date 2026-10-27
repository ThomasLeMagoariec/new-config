{ inputs, ... }:
{
	perSystem = { pkgs, ... }: {
		packages = {
			example = pkgs.hello;
			bash = inputs.wrappers.lib.wrapPackage {
				inherit pkgs;
				package = pkgs.bash;
				flags = {
					"--rcfile" = ./bashrc;
				};
			};
		};
	};
}
