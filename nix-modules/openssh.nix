{ ... }:
{
    services.openssh = {
        enable = true;
        ports = [ 22 ];
        
        settings = {
            PasswordAuthentication = true;
            X11Forwarding = true;
            PermitRootLogin = "no";
        };
    };

    programs.ssh = {
        enable = true;
        startAgent = true;

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
        };
    };
    
}
