{ config, lib, pkgs, host, ... }:

{
	imports = [
		./nixvim
        ./zsh.nix
        ./dotfiles.nix
        ./hypr.nix
        ./mako.nix
        ./dev.nix
	];

    home.packages = with pkgs; [
        eww
        libnotify
        mako
        pavucontrol
        waylandpp
        wayland
        pkg-config
        meson
        ninja
        prismlauncher
        libreoffice
    ];
}

