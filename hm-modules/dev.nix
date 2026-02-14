{ pkgs, my-pkgs, ... }: {

  nixpkgs.overlays = [
    my-pkgs.overlays.default
  ];

  home.packages = with pkgs; [
    qbittorrent
    ipmitool
    nasm
    xorriso
    grub2
    qemu
    lutris
    gemini-cli
    copilot-cli
    ncurses
    man-pages
    just
    go
    jetbrains.idea
    cargo

    librepods
  ];



}
