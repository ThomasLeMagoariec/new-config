{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.zsh = moduleWithSystem ({ pkgs, self', ... }: {
		programs.zsh = {
			enable = true;
			package = self'.packages.zsh;
			enableCompletion = true;
		};
		environment.systemPackages = [
			pkgs.zsh-completions
		];
	});
	perSystem = { pkgs, lib, ... }: {
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
				cat = "${pkgs.bat}";
				vpn-banquise = ''
					sudo systemctl restart strongswan-swanctl.service
					sudo swanctl -q
					sudo swanctl -i --child banquise
				'';

				ls = "ls --color=auto";
            	e = "exit";

				some = "nvim";
				ff = lib.getExe pkgs.fastfetch;
			};
			zshrc.content = ''
				source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
				[[ -f ${./p10k.zsh} ]] && source ${./p10k.zsh}

				# ---- completion ----
				zstyle ':completion:*' menu select                         # arrow-key menu on Tab
				zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*' # case-insensitive, partial words
				zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"   # colour file completions like ls
				zstyle ':completion:*' group-name '''                      # group results by type
				zstyle ':completion:*:descriptions' format '%F{magenta}-- %d --%f'
				zstyle ':completion:*' use-cache on
				zstyle ':completion:*' cache-path "''${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"
				zmodload zsh/complist
				bindkey -M menuselect '^[[Z' reverse-menu-complete         # Shift+Tab goes back
				setopt AUTO_MENU COMPLETE_IN_WORD ALWAYS_TO_END

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

				# ---- syntax highlighting (must be sourced last) ----
				source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
			'';
		};
	};
}
