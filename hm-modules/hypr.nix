{ pkgs, config, ... }: {

  imports = [
    ./pkgs/opt-hypridle.nix
    ./pkgs/opt-hyprpaper.nix
  ];

  services.hyprpaper.enable = true;
  services.hypridle.enable = true;

  programs.hypridle = {
    enable = true;
    idleTimeout = 30;
    keyboardTimeout = 30;
    lockTimeout = 60;
    screenTimeout = 180;
    suspendTimeout = 1800;
  };

  programs.hyprpaper = {
    enable = true;
    wallpaper = ../dotfiles/static/wallpaper.jpg;
  };

  # programs.kitty.enable = true; # required for the default Hyprland config

  wayland.windowManager.hyprland.enable = true; # enable Hyprland
  wayland.windowManager.hyprland.settings = {
      "exec-once" = "waybar & hyprpaper & hypridle &";
      "$mod" = "SUPER";
      bind =
          [
            "$mod, F, exec, kitty"
            "$mod, L, exec, hyprlock"
            "$mod, R, exec, wofi --show run"
            "$mod, C, killactive"
            "$mod, V, togglefloating"
            "$mod, M, exit"
            ", Print, exec, hyprshot -m output --clipboard-only"
            "$mod, ampersand, workspace, 1"
            "$mod, eacute, workspace, 2"
            "$mod, quotedbl, workspace, 3"
            "$mod, apostrophe, workspace, 4"
            "$mod, parenleft, workspace, 5"
            "$mod, minus, workspace, 6"
            "$mod, egrave, workspace, 7"
            "$mod, underscore, workspace, 8"
            "$mod, ccedilla, workspace, 9"
            "$mod, agrave, workspace, 10"
            "$mod_SHIFT, ampersand, movetoworkspace, 1"
            "$mod_SHIFT, eacute, movetoworkspace, 2"
            "$mod_SHIFT, quotedbl, movetoworkspace, 3"
            "$mod_SHIFT, apostrophe, movetoworkspace, 4"
            "$mod_SHIFT, parenleft, movetoworkspace, 5"
            "$mod_SHIFT, minus, movetoworkspace, 6"
            "$mod_SHIFT, egrave, movetoworkspace, 7"
            "$mod_SHIFT, underscore, movetoworkspace, 8"
            "$mod_SHIFT, ccedilla, movetoworkspace, 9"
            "$mod_SHIFT, agrave, movetoworkspace, 10"
          ];
          bindel =
          [
            ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
            ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
            ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
            ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
 
          ];
          bindl = 
          [
            ", XF86AudioNext, exec, playerctl next"
            ", XF86AudioPause, exec, playerctl play-pause"
            ", XF86AudioPlay, exec, playerctl play-pause"
            ", XF86AudioPrev, exec, playerctl previous"


          ];
  };

  wayland.windowManager.hyprland.extraConfig = ''
      input {
          kb_layout = fr
              kb_variant =
              kb_model =
              kb_options =
              kb_rules =

              follow_mouse = 1

              sensitivity = 0 # -1.0 - 1.0, 0 means no modification.

              touchpad {
                  natural_scroll = true
              }
      }

      decoration {
            active_opacity = 0.8
            inactive_opacity = 0.8
      }

      monitor=eDP-1,1920x1080,0x0,1.2
  '';

  # Optional, hint Electron apps to use Wayland:
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  # extra hypr packages
  home.packages = with pkgs; [
    hyprlock
    waybar
    hypridle
    hyprshot
    brightnessctl # used by hypridle
    kitty
  ];
}
