{ config, input, ...}:
{
    services.opensssh = {
        enable = true;
        ports = [ 22 ];
        
        settings = {
            PasswordAuthentication = true;
            X11Forwarding = true;
            PermitRootLogin = false;
        };
    };
    
}
