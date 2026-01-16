{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        gcc
        neovim
        git
        tmux
        kitty
        python3                 # python 3.12.9
        python3Packages.pip     # pip (the worlds worst package manager)
        nodejs                  # useful for anything and everything
        pyright                 # python LSP
        nix-ld
        fastfetch
        steam
        steam-run
    ];

    programs.steam.enable = true;

}

