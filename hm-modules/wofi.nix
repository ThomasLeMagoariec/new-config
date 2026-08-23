{ pkgs, ... }:
{

    home.packages = [(
        pkgs.writeShellScriptBin "soundboard" ''
        set -euo pipefail

        BASE_URL="http://sounds.lemagoariec.app"
        curl -fSL "$BASE_URL/script.sh" -o ~/.config/wofi/scripts/sound.sh

        echo $BASE_URL
        curl -fsSL "$BASE_URL/files" | while IFS= read -r file; do
        [[ -z "$file" ]] && continue

        echo "Downloading: $file"
        touch ~/.config/wofi/sounds/$file.mp3
        curl -fSL "$BASE_URL/$file.mp3" -o ~/.config/wofi/sounds/$file.mp3
        done

        chmod +x ~/.config/wofi/scripts/sound.sh

        ''
    )];

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
