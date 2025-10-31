{ config, lib, pkgs, host, ... }:

{
	imports = [
		./nixvim
        ./zsh.nix
        ./dotfiles.nix
        ./hypr.nix
	];
}

