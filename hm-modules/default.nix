{ config, lib, pkgs, host, ... }:

{
	imports = [
        ./themes
		./nixvim
        ./zsh.nix
        ./dotfiles.nix
        ./hypr.nix
        ./mako.nix
        ./dev.nix
        ./yazi.nix
        ./utils.nix
        ./graphical.nix
	];

}

