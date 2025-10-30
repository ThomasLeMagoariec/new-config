{ config, pkgs, ... }:

{

    home.file = {
        ".p10k.zsh".source = ../dotfiles/p10k.zsh;

        ".config/waybar/power_menu.xml".source = ../dotfiles/waybar/power_menu.xml;
        ".config/waybar/network_menu.xml".source = ../dotfiles/waybar/network_menu.xml;
        ".config/waybar/config.jsonc".source = ../dotfiles/waybar/config.jsonc;
        ".config/waybar/style.css".source = ../dotfiles/waybar/style.css;
        ".config/hypr/hypridle.conf".source = ../dotfiles/hypr/hypridle.conf;
    };
}
