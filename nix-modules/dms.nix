{ pkgs, dms, ...}: {
    services.displayManager.dms-greeter = {
        enable = true;
        compositor.name = "niri";
        package = inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
}
