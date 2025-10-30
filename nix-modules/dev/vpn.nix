{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.strongswan
    pkgs.openssl
  ];

  services.strongswan-swanctl.enable = true;

  services.strongswan-swanctl.swanctl = {
    authorities = {
      banquise1.file = "/home/thomas/.secrets/strongswan/cacerts/BanquiseRootCA.cacert.pem";
      banquise2.file = "/home/thomas/.secrets/strongswan/cacerts/BanquiseMachineIssuingCA.cacert.pem";
      banquise3.file = "/home/thomas/.secrets/strongswan/cacerts/BanquiseMachineSubCA.cacert.pem";
      banquise4.file = "/home/thomas/.secrets/strongswan/cacerts/BanquiseUserIssuingCA.cacert.pem";
      banquise5.file = "/home/thomas/.secrets/strongswan/cacerts/BanquiseUserSubCA.cacert.pem";
    };

    connections = {
      banquise = {
        children = {
      banquise = {
        remote_ts = [ "10.0.0.0/9" ];
      };
    };
    local = {
      banquise.auth = "pubkey";
      banquise.certs = [ "/home/thomas/.secrets/strongswan/x509/thomas.le-magoariec.pem" ];
    };
    remote = {
      banquise.auth = "pubkey";
      banquise.id = "proxy1.la-banquise.fr";
    };
    remote_addrs = [ "89.168.61.117" ];
    vips = [ "0.0.0.0" ];
      };
    };
  };
}
