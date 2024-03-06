return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function() require("telescope").load_extension("fzf") end,
		},
	},
	keys = {
		{ '<leader>ff', function() require('telescope.builtin').find_files({}) end },
		{ '<leader>fg', function() require('telescope.builtin').live_grep({}) end },
	},
}
