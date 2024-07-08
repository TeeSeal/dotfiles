return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	opts = {
		ensure_installed = {"c", "lua", "luadoc", "vim", "vimdoc", "markdown", "query", "python", "javascript", "rust", "elixir", "eex", "heex"},
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
}
