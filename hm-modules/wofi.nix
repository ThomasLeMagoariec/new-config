{ ... }:
{
    home.file = {
        ".config/wofi/sounds/hava_nagila.mp3".source = ../dotfiles/sounds/hava_nagila.mp3;
        ".config/wofi/sounds/apple_pay.mp3".source = ../dotfiles/sounds/apple_pay.mp3;
        ".config/wofi/sounds/fah.mp3".source = ../dotfiles/sounds/fah.mp3;
        ".config/wofi/sounds/vine_boom.mp3".source = ../dotfiles/sounds/vine_boom.mp3;
        ".config/wofi/sounds/windows_xp.mp3".source = ../dotfiles/sounds/windows_xp.mp3;
        ".config/wofi/sounds/metal_pipe.mp3".source = ../dotfiles/sounds/metal_pipe.mp3;
        ".config/wofi/sounds/rizz.mp3".source = ../dotfiles/sounds/rizz.mp3;
        ".config/wofi/sounds/hub.mp3".source = ../dotfiles/sounds/hub.mp3;
        ".config/wofi/sounds/applause.mp3".source = ../dotfiles/sounds/applause.mp3;
        ".config/wofi/sounds/for_sure.mp3".source = ../dotfiles/sounds/for_sure.mp3;
        ".config/wofi/sounds/frank_leboeuf.mp3".source = ../dotfiles/sounds/frank_leboeuf.mp3;
        ".config/wofi/sounds/sncf.mp3".source = ../dotfiles/sounds/sncf.mp3;
        ".config/wofi/sounds/max_verstappen.mp3".source = ../dotfiles/sounds/max_verstappen.mp3;
        ".config/wofi/scripts/sound.sh" = {
            executable = true;
            text = ''
#!/usr/bin/env bash

options="hava nagila
apple pay
fah
vine boom
windows xp
metal pipe
rizz
hub
applause
for sure
frank leboeuf
sncf
max verstappen"

chosen=$(echo "$options" | wofi --dmenu --prompt "Sound")

case "$chosen" in
    "hava nagila")
        pw-play ~/.config/wofi/sounds/hava_nagila.mp3
        ;;
    "apple pay")
        pw-play ~/.config/wofi/sounds/apple_pay.mp3
        ;;
    "fah")
        pw-play ~/.config/wofi/sounds/fah.mp3
        ;;
    "vine boom")
        pw-play ~/.config/wofi/sounds/vine_boom.mp3
        ;;
    "windows xp")
        pw-play ~/.config/wofi/sounds/windows_xp.mp3
        ;;
    "metal pipe")
        pw-play ~/.config/wofi/sounds/metal_pipe.mp3
        ;;
    "rizz")
        pw-play ~/.config/wofi/sounds/rizz.mp3
        ;;
    "hub")
        pw-play ~/.config/wofi/sounds/hub.mp3
        ;;
    "applause")
        pw-play ~/.config/wofi/sounds/applause.mp3
        ;;
    "for sure")
        pw-play ~/.config/wofi/sounds/for_sure.mp3
        ;;
    "frank leboeuf")
        pw-play ~/.config/wofi/sounds/frank_leboeuf.mp3
        ;;
    "sncf")
        pw-play ~/.config/wofi/sounds/sncf.mp3
        ;;
    "max verstappen")
        pw-play ~/.config/wofi/sounds/max_verstappen.mp3
        ;;
    esac
                    '';
        };
    };

    programs.wofi = {
        enable = true;
        style = ''
window {
    margin: 0px;
    border: 2px solid #89b4fa;
    background-color: #1e1e2e;
    border-radius: 14px;
    font-family: "JetBrainsMono Nerd Font", monospace;
    font-size: 14px;
}

#input {
    margin: 12px;
    padding: 10px 14px;
    border: none;
    color: #cdd6f4;
    background-color: #313244;
    border-radius: 10px;
}

#input:focus {
    border: 2px solid #89b4fa;
    outline: none;
}

#outer-box {
    margin: 12px;
    padding: 0px;
    background-color: #1e1e2e;
}

#inner-box {
    margin: 0px;
    padding: 0px;
    background-color: #1e1e2e;
}

#scroll {
    margin-top: 8px;
}

#text {
    margin: 6px;
    color: #cdd6f4;
}

#entry {
    padding: 10px;
    border-radius: 10px;
    background-color: transparent;
}

#entry:selected {
    background-color: #45475a;
    border: 1px solid #89b4fa;
}

#entry:selected #text {
    color: #89b4fa;
    font-weight: bold;
}

#img {
    margin-right: 10px;
}

#unselected {
    color: #bac2de;
}

#selected {
    color: #89b4fa;
}

        '';
    };
}
