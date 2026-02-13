rebuild_all: rebuild_nix rebuild_home

rebuild_nix:
    sudo nixos-rebuild switch --flake .#laptop

rebuild_home:
    home-manager switch --flake .#thomas

rebuild_cool:
    home-manager switch --flake .#thomas &> log &
    cbonsai -l
    
