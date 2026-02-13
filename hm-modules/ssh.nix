{ ... }:
let
    prefs = import ../prefs.nix;
in
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
                    "/home/${prefs.username}/.ssh/id_jean"
                    "/home/${prefs.username}/.ssh/id_key"
                ];
            };
            "epita" = {
                host = "git.forge.epita.fr";
                user = "${prefs.username}.le-magoariec";
                identityFile = [
                    "/home/${prefs.username}/.ssh/id_jean"
                    "/home/${prefs.username}/.ssh/id_key"
                ];
            };
            "la-banquise" = {
                host = "git.la-banquise.fr";
                user = "git";
                identityFile = [
                    "/home/${prefs.username}/.ssh/id_jean"
                    "/home/${prefs.username}/.ssh/id_key"
                ];
            };
        };
    };
}
