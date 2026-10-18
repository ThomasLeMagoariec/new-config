{ ... }:
{
	flake.nixosModules.zsh = { pkgs, ... }:
	{
		users.defaultUserShell = pkgs.zsh;

		environment.systemPackages = with pkgs; [
			zsh-powerlevel10k
			meslo-lgs-nf
		];

		programs.zsh = {
			enable = true;
			enableCompletion = true;
        	autosuggestions.enable = true;
        	syntaxHighlighting.enable = true;

			shellAliases = {
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
				cat = "bat";
				vpn-banquise = ''
				sudo systemctl restart strongswan-swanctl.service
				sudo swanctl -q
				sudo swanctl -i --child banquise
				'';


				fastfetch = "randomfetch";
				ff = "randomfetch";
				ls = "ls --color=auto";
				e = "exit";
			};
			ohMyZsh = {
				enable = true;
				plugins = [
					"colored-man-pages"
				];
			};

			promptInit = ''
				source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

				# [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
			'';

			shellInit = ''
				source ~/.p10k.zsh
				eval "$(zoxide init zsh)"
				export EDITOR=vim
			'';

		};
	};
}
