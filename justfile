rebuild:
    sudo nixos-rebuild switch --flake .#laptop
    home-manager switch --flake .#thomas
