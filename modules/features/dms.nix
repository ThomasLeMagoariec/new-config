{ self, inputs, ... }: {
    flake.nixosModules.dms = { pkgs, inputs, pkgs-unstable, ... }: {
        imports = [
            inputs.dms.nixosModules.dank-material-shell
        ];

        home.packages = with pkgs; [ libsForQt5.qt5.qtwayland ];

        programs.dank-material-shell = {
            enable = true;
            dgop.package = pkgs-unstable.dgop;

            enableSystemMonitoring = true;
            enableVPN = true;
            enableDynamicTheming = true;
            enableAudioWavelength = true;
            enableCalendarEvents = true;
        };
    };
}
