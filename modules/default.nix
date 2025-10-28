{ config, lib, pkgs, host, ... }:

{
    environment.systemPackages = with pkgs; [
        neovim
        git
        tmux
        kitty
        python3                 # python 3.12.9
        python3Packages.pip     # pip (the worlds worst package manager)
        nodejs                  # useful for anything and everything
        gcc11                   # C/C++

        pyright                 # python LSP
        nix-ld
    ];

    programs.zsh.enable = true;

}

