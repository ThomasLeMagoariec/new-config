{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    yazi
    zoxide
    fzf
  ];

  home.file = {
    ".config/yazi/theme.toml".source = ../dotfiles/yazi/theme.toml;
  };
}
