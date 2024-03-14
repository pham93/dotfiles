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
  { "feline-nvim/feline.nvim", priority = 1000 },
  { "nvim-lualine/lualine.nvim", enabled = false },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2000,
      render = "compact",
      stages = "fade_in_slide_out",
      top_down = false,
    },
  },
}
