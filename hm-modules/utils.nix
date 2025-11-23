{ pkgs, lib, config, preferences, ... }: {

  home.packages = with pkgs; [
    pavucontrol
    pkg-config
  ] ++ lib.optionals (preferences.name == "Thomas") [ cowsay ];
}
