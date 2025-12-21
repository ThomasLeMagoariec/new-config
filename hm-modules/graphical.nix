{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    libreoffice
    prismlauncher
    obsidian
  ];
}
