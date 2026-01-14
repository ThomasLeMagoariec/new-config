{ pkgs, ... }: {
    home.packages = with pkgs; [
        cbonsai
        tree
        meslo-lgs-nf
    ];
}
