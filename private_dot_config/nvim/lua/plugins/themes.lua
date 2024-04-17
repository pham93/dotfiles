if vim.g.vscode then
	return {}
end

return {
	{ "AlphaTechnolog/pywal.nvim", priority = 1000 },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		enabled = true,
	},
	{
		"mbrea-c/wal-colors.nvim",
		enabled = true,
		-- config = function()
		-- 	vim.cmd([[colorscheme mbc]]) -- activate the colorscheme
		-- end,
		priority = 2000,
	},
}
