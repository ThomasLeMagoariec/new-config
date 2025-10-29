{
  programs.kitty.enable = true; # required for the default Hyprland config
  wayland.windowManager.hyprland.enable = true; # enable Hyprland
  wayland.windowManager.hyprland.settings = {
      "$mod" = "SUPER";
      bind =
          [
            "$mod, F, exec, kitty"
            "$mod, R, exec, wofi --show run"
            ", Print, exec, grimblast copy area"
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
  '';
  # Optional, hint Electron apps to use Wayland:
  # home.sessionVariables.NIXOS_OZONE_WL = "1";
}
