{ inputs, moduleWithSystem, lib, ... }:
{
	flake.nixosModules.tmux = moduleWithSystem ({ pkgs, self', ... }: {
		environment.systemPackages = [
			self'.packages.tmux
		];
	});
	perSystem = { pkgs, lib, self', ... }: {
		packages.tmux = inputs.wrappers.wrappers.tmux.wrap {
			inherit pkgs;

			shell = lib.getExe self'.packages.zsh;
			terminal = "tmux-256color";
			historyLimit = 10000;
			modeKeys = "vi";
			mouse = true;

			plugins = [
				{
					plugin = pkgs.tmuxPlugins.catppuccin;
					configAfter = ''
						set -g @catppuccin_flavour "mocha"
						set -g @catppuccin_window_status_style "rounded"
					'';
				}
				{
					plugin = pkgs.tmuxPlugins.continuum;
					configAfter = ''
						set -g @continuum-restore 'on'
						set -g @continuum-save-interval '10'
					'';
				}
				{ plugin = pkgs.tmuxPlugins.resurrect; }
				{ plugin = pkgs.tmuxPlugins.yank; }
			];

			configAfter = ''
				set -g renumber-windows on
				bind y copy-mode
				bind-key -T copy-mode-vi v send -X begin-selection
				bind-key -T copy-mode-vi y send -X copy-selection-and-cancel

				set -g @resurrect-capture-pane-contents 'on'
				set -g @resurrect-strategy-nvim 'session'
			'';
		};
	};
}

