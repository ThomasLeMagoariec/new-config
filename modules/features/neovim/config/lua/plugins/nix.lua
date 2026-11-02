-- Adjustments so LazyVim works with Nix-provided plugins and tools.
local nixInfo = require(vim.g.nix_info_plugin_name)

return {
  -- Mason downloads binaries that don't run on NixOS; tools come from
  -- `runtimePkgs` in default.nix instead. LazyVim enables every configured
  -- LSP server directly when mason-lspconfig is absent.
  { "mason-org/mason.nvim", enabled = false },
  { "mason-org/mason-lspconfig.nvim", enabled = false },

  -- Point nvim-treesitter at the grammars Nix built, so it sees them as
  -- installed and never tries to compile parsers itself.
  {
    "nvim-treesitter/nvim-treesitter",
    build = false,
    opts = function(_, opts)
      opts.install_dir = nixInfo(nil, "plugins", "start", "COLLATED_TS_GRAMMARS")
      opts.ensure_installed = {}
    end,
  },
}
