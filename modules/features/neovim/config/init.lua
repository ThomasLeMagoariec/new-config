-- LazyVim, with every plugin provided by Nix.
-- Plugins live in the wrapper's `opt` directory, named the way lazy.nvim
-- names them, and `dev.path` below makes lazy.nvim load them from there.
local nixInfo = require(vim.g.nix_info_plugin_name)

-- keep LazyVim's and lazy.nvim's state files out of the read-only config dir
vim.g.lazyvim_json = vim.fn.stdpath("data") .. "/lazyvim.json"

vim.opt.rtp:prepend(nixInfo(nil, "plugins", "lazy", "lazy.nvim"))

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.lang.nix" },
    { import = "plugins" },
  },
  defaults = { lazy = false, version = false },
  dev = {
    path = nixInfo(nil, "opt_dir"),
    patterns = { "" }, -- every plugin is a "dev" plugin
    fallback = true, -- anything Nix didn't provide (e.g. a new extra) is cloned with git
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = false }, -- updates come from `nix flake update`
  change_detection = { enabled = false },
  lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
  performance = {
    -- keep the wrapper's packpath/rtp entries (config dir, grammars)
    reset_packpath = false,
    rtp = {
      reset = false,
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
