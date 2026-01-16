{ pkgs, ... }: {

  home.packages = with pkgs; [
    libreoffice
    prismlauncher
    obsidian
  ];
}
