{ pkgs, pkgs-unstable, ... }: {

    environment.systemPackages =
        (with pkgs; [
            quarkus
            maven
            jdk21
            gnumake
            pnpm
            SDL2
            wine
            norminette
        ])
        ++ (with pkgs-unstable; [
            playerctl
            gnumake
            docker
        ]);

  programs.nix-ld.enable = true;

  virtualisation.docker = {
      enable = true;
      package = pkgs.docker_25;
  };

  users.users.thomas.extraGroups = [ "docker" ];


}
