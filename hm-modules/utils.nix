{ pkgs, lib, config, preferences, ... }: {

  home.packages = with pkgs; [
    pavucontrol
    pkg-config
  ];
}
