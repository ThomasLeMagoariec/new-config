{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            test = "echo bite";
            bite = "echo heyy";
        };
        zplug = {
            enable = true;
            plugins = [
                { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
                { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } 
            ];
        };

        extraConfig = ''POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=True'';
    };
}
