{ pkgs, lib, ... }: {

    imports = [
        ./pkgs/opt-niri.nix
    ];

    programs.niri = {
        enable = true;
        spawnAtStart = [ "testList1" "testList2" ];
        preferNoCSD = true;

        input = {
            keyboard = {
                xkb.layout = "fr,fr";
                numlock = true;
            };
            touchpad = {
                off = true;
                accel-speed = 0.2;
            };
        };
    };

    home.packages = with pkgs; [
        niri
        alacritty
        fuzzel
        xwayland-satellite
    ];

    home.file = {
        ".config/niri/config.kdl".source = ../dotfiles/niri.kdl;
    };

}
