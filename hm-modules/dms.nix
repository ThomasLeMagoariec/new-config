{ config, inputs, pkgs, pkgs-unstable, ... }:
{
    imports = [
        inputs.dms.homeModules.dank-material-shell
    ];

    home.packages = with pkgs; [
        libsForQt5.qt5.qtwayland
    ];

    programs.dank-material-shell = {
        enable = true;
        dgop.package = pkgs-unstable.dgop;

        systemd = {
            enable = true;             # Systemd service for auto-start
            restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
        };

# Core features
        enableSystemMonitoring = true;     # System monitoring widgets (dgop)
        enableVPN = true;                  # VPN management widget
        enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
        enableAudioWavelength = true;      # Audio visualizer (cava)
        enableCalendarEvents = true;
    };

    systemd.user.services.dms = {
        Service = {
            Environment = "PATH=${pkgs-unstable.quickshell}/bin:${config.home.profileDirectory}/bin:/run/current-system/sw/bin";
        };
    };
}

