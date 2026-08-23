{ lazyvim, pkgs, ... }:
{
	imports = [ lazyvim.homeManagerModules.default ];
	home.packages = [ pkgs.statix ];
	programs.lazyvim = {
		enable = true;

		config = {
			options = ''
				vim.opt.tabstop = 4
				vim.opt.shiftwidth = 4
				vim.opt.expandtab = false
				vim.opt.rnu = false
				vim.g.autoformat = false
			'';
			autocmds = ''
				vim.api.nvim_create_autocmd("FileType", {
					pattern = { "c", "cpp" },
					callback = function()
						vim.bo.shiftwidth = 4
						vim.bo.tabstop = 4
						vim.bo.expandtab = false
					end,
				})
			'';
		};

		extras = {
			lang = {
				nix.enable = true;
				python = {
					enable = true;
					installDependencies = true;
					installRuntimeDependencies = true;
				};
				go = {
					enable = true;
					installDependencies = true;
					installRuntimeDependencies = true;
				};
				clangd = {
					enable = true;
					installDependencies = true;        # installs clangd (LSP) + related tools
					installRuntimeDependencies = true; # installs a C/C++ toolchain
				};
			};
		};

		extraPackages = with pkgs; [
			nixd       # Nix LSP
			alejandra  # Nix formatter
		];

		treesitterParsers = with pkgs.vimPlugins.nvim-treesitter-parsers; [
			wgsl      # WebGPU Shading Language
			templ     # Go templ files
		];

		plugins = {
			colorscheme = ''
			return {
				{
					"catppuccin/nvim",
					lazy = false,
					priority = 1000,
					opts = { flavour = "mocha" },
				},
				{
					"LazyVim/LazyVim",
					opts = { colorscheme = "catppuccin" },
				},
			}
			'';
		};
	};
}
