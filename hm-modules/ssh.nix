{ ... }:
{
    services.ssh-agent.enable = true;

    programs.ssh = {
        enable = true;

        extraConfig = ''
            AddKeysToAgent yes
        '';

        matchBlocks = {
            "git" = {
                host = "gitlab.com github.com";
                user = "git";
                identityFile = [
                    "/home/thomas/.ssh/id_jean"
                    "/home/thomas/.ssh/id_key"
                ];
            };
            "epita" = {
                host = "git.forge.epita.fr";
                user = "thomas.le-magoariec";
                identityFile = [
                    "/home/thomas/.ssh/id_jean"
                    "/home/thomas/.ssh/id_key"
                ];
            };
            "la-banquise" = {
                host = "git.la-banquise.fr";
                user = "git";
                identityFile = [
                    "/home/thomas/.ssh/id_jean"
                    "/home/thomas/.ssh/id_key"
                ];
            };
        };
    };
}
