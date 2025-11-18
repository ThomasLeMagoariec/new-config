{ pkgs, config, ... }: {

  environment.systemPackages = with pkgs; [
    quarkus
    docker
    maven
    jdk21
    gnumake
    pnpm
  ];

  virtualisation.docker = {
      enable = true;
  };

  users.users.nekochira.extraGroups = [ "docker" ];

}
