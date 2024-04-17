if vim.g.vscode then
	return {
		{
			"folke/flash.nvim",
			enabled = true,
			opts = {
				modes = { search = { enabled = false }, char = { enabled = false } },
			},
		},
		{ "echasnovski/mini.surround", enabled = false },
		{ "xiyaowong/fast-cursor-move.nvim", vscode = true },
		{
			"kylechui/nvim-surround",
			version = "*", -- Use for stability; omit to use `main` branch for the latest features
			event = "VeryLazy",
			vscode = true,
			config = function()
				require("nvim-surround").setup()
			end,
		},
	}
end
return {
	{
		"nvim-tree/nvim-tree.lua",
		enabled = true,
		config = function()
			require("nvim-tree").setup()
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = false,
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
		config = function()
			require("colorizer").setup({
				"css",
				"javascript",
			})
		end,
	},
	{
		"ahmedkhalf/project.nvim",
		enabled = true,
		config = function()
			require("project_nvim").setup({
				patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".proj" },
			})
		end,
	},

	{
		"folke/flash.nvim",
		enabled = true,
		opts = {
			modes = { search = { enabled = false }, char = { enabled = false } },
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{ "echasnovski/mini.surround", enabled = false },
	{
		"HiPhish/rainbow-delimiters.nvim",
	},
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "feline-nvim/feline.nvim", priority = 1000, enabled = true },
	{ "nvim-lualine/lualine.nvim", enabled = false },
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 2000,
			level = vim.log.levels.ERROR,
			render = "compact",
			stages = "fade_in_slide_out",
			top_down = false,
		},
	},
	{
		"rktjmp/fwatch.nvim",
	},
}
