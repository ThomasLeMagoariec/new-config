{ config, pkgs, ... }:

{

    home.file = {
        ".p10k.zsh".source = ../dotfiles/p10k.zsh;

        ".config/waybar/power_menu.xml".source = ../dotfiles/waybar/power_menu.xml;
        ".config/waybar/network_menu.xml".source = ../dotfiles/waybar/network_menu.xml;
        ".config/waybar/power_menu.xml".source = ../dotfiles/waybar/power_menu.xml;
        ".config/waybar/power_menu.xml".source = ../dotfiles/waybar/power_menu.xml;
        ".config/waybar/power_menu.xml".source = ../dotfiles/waybar/power_menu.xml;
    };
}
