{ pkgs, config, ... }: {

  environment.systemPackages = with pkgs; [
    quarkus
    docker
    maven
    jdk21
  ];

  virtualisation.docker = {
      enable = true;
  };

  users.users.thomas.extraGroups = [ "docker" ];

}
