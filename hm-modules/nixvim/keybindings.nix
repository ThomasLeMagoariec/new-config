{self, ...}: {
    programs.nixvim.keymaps = [
        { key = "<leader>ca"; action = "<cmd>lua vim.lsp.buf.code_action()<CR>"; }
        { key = "<leader>fe"; action = "<cmd>Neotree filesystem reveal left<CR>"; }
    ];
}
