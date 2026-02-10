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

        extraConfig = ''
            AddKeysToAgent yes
        '';

        matchBlocks = {
            "git" = {
                host = "gitlab.com github.com";
                user = "git";
                identityFile = [
                    "~/.ssh/id_jean"
                    "~/code/nix/new-config/keys/id_key.pub"
                ];
            };
            "epita" = {
                host = "git.forge.epita.fr";
                user = "thomas.le-magoariec";
                identityFile = [
                    "~/.ssh/id_jean"
                    "~/code/nix/new-config/keys/id_key.pub"
                ];
            };
        };
    };
    
}
