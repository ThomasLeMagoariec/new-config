{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.neovim = moduleWithSystem ({ self', ... }: {
		environment.systemPackages = [
			self'.packages.neovim
		];
		environment.variables.EDITOR = "nvim";
	});
	perSystem = { pkgs, lib, ... }: {
		packages.neovim = inputs.wrappers.wrappers.neovim.wrap {
			inherit pkgs;
			settings.config_directory = ./config;

			# Every plugin LazyVim uses out of the box, keyed by the name lazy.nvim
			# gives it. They are linked into the wrapper's `opt` directory under
			# these names, and init.lua points lazy.nvim's `dev.path` there, so
			# lazy.nvim loads them from the Nix store instead of cloning them.
			specs.lazyvim = {
				lazy = true;
				# plugin dependencies from nixpkgs also go to `opt`, where lazy.nvim
				# can find them; treesitter grammars are still collected into one
				# start plugin (COLLATED_TS_GRAMMARS) by the wrapper.
				pluginDeps = "lazy";
				data = lib.mapAttrsToList (pname: data: { inherit pname data; }) (
					with pkgs.vimPlugins;
					{
						"lazy.nvim" = lazy-nvim;
						"LazyVim" = LazyVim;
						"snacks.nvim" = snacks-nvim;
						"tokyonight.nvim" = tokyonight-nvim;
						"catppuccin" = catppuccin-nvim;
						"bufferline.nvim" = bufferline-nvim;
						"lualine.nvim" = lualine-nvim;
						"noice.nvim" = noice-nvim;
						"nui.nvim" = nui-nvim;
						"mini.icons" = mini-icons;
						"mini.ai" = mini-ai;
						"mini.pairs" = mini-pairs;
						"ts-comments.nvim" = ts-comments-nvim;
						"lazydev.nvim" = lazydev-nvim;
						"blink.cmp" = blink-cmp;
						"friendly-snippets" = friendly-snippets;
						"conform.nvim" = conform-nvim;
						"nvim-lint" = nvim-lint;
						"nvim-lspconfig" = nvim-lspconfig;
						"nvim-treesitter" = nvim-treesitter.withAllGrammars;
						"nvim-treesitter-textobjects" = nvim-treesitter-textobjects;
						"nvim-ts-autotag" = nvim-ts-autotag;
						"flash.nvim" = flash-nvim;
						"which-key.nvim" = which-key-nvim;
						"gitsigns.nvim" = gitsigns-nvim;
						"trouble.nvim" = trouble-nvim;
						"todo-comments.nvim" = todo-comments-nvim;
						"grug-far.nvim" = grug-far-nvim;
						"persistence.nvim" = persistence-nvim;
						"plenary.nvim" = plenary-nvim;
					}
				);
			};

			# Replaces Mason: language servers, formatters, linters and tools
			# that LazyVim (and the nix extra enabled in init.lua) expects on PATH.
			runtimePkgs = with pkgs; [
				# lua (LazyVim defaults)
				lua-language-server
				stylua
				# shell
				shfmt
				# nix (lazyvim.plugins.extras.lang.nix)
				nil
				nixfmt
				statix
				# pickers / git
				ripgrep
				fd
				lazygit
				git
			];
		};
	};
}
