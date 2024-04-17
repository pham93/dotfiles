-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")

vim.opt.swapfile = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.g.vscode then
	return
end

local ctp_feline = require("catppuccin.groups.integrations.feline")
ctp_feline.setup({})
require("feline").setup({
	components = ctp_feline.get(),
})

require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		separator_style = "slant",
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		offsets = {
			{
				filetype = "nvim-tree",
				text = "File Explorer",
				highlight = "Directory",
				separator = true,
			},
		},
	},
})

require("dashboard").setup({
	theme = "hyper",
	config = {
		week_header = { enabled = true },
	},
})

vim.cmd.colorscheme("pywal")

local fwatch = require("fwatch")

fwatch.watch("/home/redbull/.cache/wal/colors.Xresources", {
	on_event = function()
		vim.schedule(function()
			vim.cmd.colorscheme("pywal")
		end)
	end,
})
