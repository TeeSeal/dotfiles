return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
    },
    config = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "TelescopeFindPre",
            callback = function()
                vim.opt_local.winborder = "none"
                vim.api.nvim_create_autocmd("WinLeave", {
                    once = true,
                    callback = function()
                        vim.opt_local.winborder = "rounded"
                    end,
                })
            end,
        })
    end,
    keys = {
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files({})
            end,
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep({})
            end,
        },
        {
            "<leader>fb",
            function()
                require("telescope.builtin").buffers({})
            end,
        },
    },
}
