{ config, lib, pkgs, host, ... }:

{
	imports = [
		./nixvim
        ./zsh.nix
        ./dotfiles.nix
        ./hypr.nix
        ./mako.nix
        ./dev.nix
        ./yazi.nix
	];

    home.packages = with pkgs; [
        pavucontrol
        pkg-config
        prismlauncher
        libreoffice
    ];
}

