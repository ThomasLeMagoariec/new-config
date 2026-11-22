{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.zsh = moduleWithSystem ({ pkgs, self', ... }: {
		programs.zsh = {
			enable = true;
			package = self'.packages.zsh;
			enableCompletion = true;
			enableBashCompletion = true;
			autosuggestions.enable = true;
			syntaxHighlighting.enable = true;
			histSize = 10000;
		};
		environment.systemPackages = [
			pkgs.zsh-completions
		];
	});
	perSystem = { pkgs, lib, self', ... }: {
		packages.zsh = inputs.wrappers.wrappers.zsh.wrap {
			inherit pkgs;
			zshAliases = {
				ga = "git add -A";
				gc = "git commit -m";
				gac = "git add -A && git commit -m";
				gaca = "git add -A && git commit -m auto";
				gacp = "git add -A && git commit -m auto && git push";
				gp = "git push";
				gP = "git pull";
				gs = "git status";
				gd = "git diff";

				code = "cd ~/code";
				cat = "${lib.getExe pkgs.bat}";
				vpn-banquise = ''
					sudo systemctl restart strongswan-swanctl.service
					sudo swanctl -q
					sudo swanctl -i --child banquise
				'';

				ls = "${lib.getExe pkgs.lsd} --tree --depth 1";
            	e = "exit";

				some = "nvim";
				ff = lib.getExe pkgs.fastfetch;
			};
			zshrc.content = ''
				function sshp {
					TERM=xterm-256color command ssh -t "$@" \
					'exec env PS1="\[\e[32m\]󰒋 \h\[\e[0m\] | \[\e[34m\]\w\[\e[0m\]\n\[\e[35m\]❯\[\e[0m\] " bash --norc -i'
				}
				autoload -U compinit && compinit
				export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
				zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
				source <(${lib.getExe pkgs.carapace} _carapace)
				zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

				autoload -U select-word-style
				select-word-style bash

				# ---- suggestions from history as you type (→ or End to accept) ----
				source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
				ZSH_AUTOSUGGEST_STRATEGY=(history completion)
				ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6e738d'               # catppuccin overlay0
				bindkey '^ ' autosuggest-accept                            # Ctrl+Space also accepts

				# history, so suggestions have something to work with
				HISTFILE="$HOME/.zsh_history"
				HISTSIZE=50000
				SAVEHIST=50000
				setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE

				eval "$(${lib.getExe self'.packages.ohMyPosh} init zsh)"
				eval "$(${lib.getExe pkgs.zoxide} init zsh)"
				# ---- syntax highlighting (must be sourced last) ----
				source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
			'';
		};
		packages.ohMyPosh = inputs.wrappers.wrappers.oh-my-posh.wrap {
			inherit pkgs;
			configFile = ./config.toml;
		};
	};
}
