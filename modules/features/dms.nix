{ self, inputs, ... }: {
    flake.nixosModules.dms = { pkgs, inputs, ... }: {
       imports = [
            inputs.dms.homeModules.dank-material-shell
       ];
    }
}
