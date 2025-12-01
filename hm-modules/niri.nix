{ pkgs, config, lib, ... }: {
  home.packages = with pkgs; [
    niri
    alacritty
    fuzzel
    xwayland-satellite
  ];

  home.file = {
    ".config/niri/config.kdl".source = ../dotfiles/niri.kdl;
  };

}
