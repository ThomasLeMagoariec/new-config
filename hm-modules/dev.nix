{ pkgs, config, ... }: {
  # extra hypr packages
  home.packages = with pkgs; [
    qbittorrent
  ];
}
