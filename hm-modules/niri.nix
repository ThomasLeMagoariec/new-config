{ pkgs, config, lib, ... }: {
  home.packages = with pkgs; [
    niri
    alacritty
    fuzzel
    xwayland-satellite
  ];

}
