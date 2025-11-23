{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    pavucontrol
    pkg-config
  ];
}
