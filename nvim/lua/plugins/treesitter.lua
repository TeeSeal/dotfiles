return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	opts = {
		ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "python", "javascript", "rust"},
		auto_install = true,
		highlight = { enable = true },
	},
}
