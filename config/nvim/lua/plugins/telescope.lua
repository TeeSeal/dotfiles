return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },
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
