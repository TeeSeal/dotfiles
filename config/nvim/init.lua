vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.listchars = "tab:» ,lead:·,trail:·"
vim.opt.list = true

vim.opt.winborder = "rounded"
vim.api.nvim_set_option("clipboard", "unnamed")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", { ui = { border = "rounded" } })


-- Reset cursor shape on exit
vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
        vim.opt.guicursor = ""
        vim.fn.chansend(vim.v.stderr, "\x1b[ q")
    end,
})
