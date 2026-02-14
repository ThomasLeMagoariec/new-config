{ ... }:
let
    prefs = import ../../prefs.nix;
in
{
  programs.git = {
    enable = true;
    config = {
      push = { autoSetupRemote = true; };
      user = {
          name = "${prefs.username}";
          email = "thomas.lemagoariec@outlook.com";
      };
    };
  };
}
