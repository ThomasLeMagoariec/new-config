{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    yazi
  ];
}
