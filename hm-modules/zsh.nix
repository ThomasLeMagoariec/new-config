{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            ga = "git add -A";
            gc = "git commit -m";
            gac = "git add -A && git commit -m";
            gaca = "git add -A && git commit -m auto";
            gacp = "git add -A && git commit -m auto && git push";
            gp = "git push";
            gP = "git pull";
            gs = "git status";

            e = "exit";
        };
        zplug = {
            enable = true;
            plugins = [
                { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
                { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } 
            ];
        };

        initContent = ''source ~/.p10k.zsh'';
    };
}
