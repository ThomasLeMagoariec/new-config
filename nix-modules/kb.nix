{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    vial
  ];

  services.udev.extraRules = ''
# Vial/VIA keyboards
      SUBSYSTEM=="usb", ATTRS{idVendor}=="4653", MODE="0666"
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="4653", MODE="0666"
  '';


}
