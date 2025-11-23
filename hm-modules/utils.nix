{ pkgs, lib, config, name, ... }: {

  home.packages = with pkgs; [
    pavucontrol
    pkg-config
  ] ++ lib.optionals (name == "Thomas") [ cowsay ];
}
