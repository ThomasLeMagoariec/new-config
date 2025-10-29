{ config, lib, pkgs, host, ... }:

{
	imports = [
		./nixvim
        ./zsh.nix
	];
}

