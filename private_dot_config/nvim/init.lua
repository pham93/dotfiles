-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")

--vscode init
if vim.g.vscode then
  -- local plugins = require("lazy").plugins()
  -- local loaded_plugins = ""
  -- for _, v in pairs(plugins) do
  --   loaded_plugins = loaded_plugins .. "\n" .. tostring(v.name)
  -- end
  -- print("Loaded plugins\n" .. loaded_plugins)
  return
end

vim.opt.termguicolors = true
vim.opt.mousemoveevent = true
vim.opt.relativenumber = true

vim.cmd.colorscheme("catppuccin-mocha")

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
        filetype = "neo-tree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true,
      },
    },
  },

  require("dashboard").setup({
    theme = "hyper",
    config = {
      week_header = { enabled = true },
    },
  }),
})
