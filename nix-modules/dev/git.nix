{ ... }:

{
  programs.git = {
    enable = true;
    config = {
      push = { autoSetupRemote = true; };
      user = {
          name = "Thomas";
          email = "thomas.lemagoariec@outlook.com";
      };
    };
  };
}
