return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("diffview").setup()
		vim.opt.fillchars:append({ diff = "╱" })
	end,
}
