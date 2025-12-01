{ pkgs, config, lib, ... }: {
  home.packages = with pkgs; [
    niri
    alacritty
  ];

}
