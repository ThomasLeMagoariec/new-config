{ pkgs, config, ... }: {

  home.packages = with pkgs; [
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
