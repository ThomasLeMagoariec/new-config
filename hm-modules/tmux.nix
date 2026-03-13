{ pkgs, ...}:
{
    programs.tmux = {
        enable = true;
        shell = "${pkgs.zsh}/bin/zsh";
        terminal = "tmux-256color";
        historyLimit = 10000;

        plugins = [
            {
                plugin = pkgs.tmuxPlugins.catppuccin;
                extraConfig = ''
                    set -g @catppuccin_flavour "mocha"
                    set -g @catppuccin_window_status_style "rounded"
                '';
            }
            pkgs.tmuxPlugins.resurrect
            pkgs.tmuxPlugins.yank
            {
                plugin = pkgs.tmuxPlugins.continuum;
                extraConfig = ''
                    set -g @continuum-restore 'on'
                    set -g @continuum-save-interval '10'
                '';
            }
        ];

        extraConfig = ''
            set -g renumber-windows on
            set -g mouse on
            set -g @resurrect-capture-pane-contents 'on'
            set -g @resurrect-strategy-nvim 'session'

            set -g mode-keys vi
            bind-key -T copy-mode-vi v send -X begin-selection
            bind-key -T copy-mode-vi y send -X copy-selection-and-cancel
        '';
    };
}
