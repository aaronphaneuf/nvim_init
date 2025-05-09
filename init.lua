-- ╭──────────────────────────────────────────────────────────╮
-- │                      General Settings                     │
-- ╰──────────────────────────────────────────────────────────╯
vim.g.mapleader = " "  -- Spacebar as leader

-- ╭──────────────────────────────────────────────────────────╮
-- │                         Keymaps                           │
-- ╰──────────────────────────────────────────────────────────╯
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })

-- ╭──────────────────────────────────────────────────────────╮
-- │                  Bootstrap Lazy.nvim                      │
-- ╰──────────────────────────────────────────────────────────╯
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- ╭──────────────────────────────────────────────────────────╮
-- │                       Plugins                             │
-- ╰──────────────────────────────────────────────────────────╯
require("lazy").setup({
  -- Core dependencies
  { "nvim-lua/plenary.nvim" },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    config = function()
      require("telescope").setup({
        defaults = {
          layout_config = {
            prompt_position = "top",
            width = 0.9,
            height = 0.85,
          },
          sorting_strategy = "ascending",
        },
      })
    end,
  },

  -- Which-Key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({})
    end,
  },

  -- Dev Icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require("nvim-web-devicons").setup({})
    end,
  },

  -- Mini Icons
  {
    "echasnovski/mini.icons",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("mini.icons").setup()
    end,
  },

  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
})

