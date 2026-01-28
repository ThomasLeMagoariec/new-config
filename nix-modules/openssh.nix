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
    };
    
}
