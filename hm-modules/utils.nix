{ pkgs, ... }: {

  home.packages = with pkgs; [
    pavucontrol
    pkg-config
  ];
}
