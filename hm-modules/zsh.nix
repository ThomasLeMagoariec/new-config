{
    programs.zsh = {
        enable = true;
        enableCompletions = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            test = "echo bite";
        };
    };
}
