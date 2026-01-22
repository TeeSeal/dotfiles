return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.enable("pyright")
    end,
}
