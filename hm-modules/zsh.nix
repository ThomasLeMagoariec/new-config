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

        oh-my-zsh = {
            enable = true;
            theme = "powerlevel10k";
        };
    };
}
