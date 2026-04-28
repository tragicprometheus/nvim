-- tragicprometheus' nvim config
-- heavily inspired by:
--   BreadOnPenguins (https://github.com/BreadOnPenguins/nvim)
--   kickstart.nvim (https://github.com/nvim-lua/kickstart.nvim)
-- keymaps are in lua/config/keymaps.lua
-- install a patched font & ensure your terminal supports glyphs

local vim = vim

-- ---------------------------------------------------------------------------
-- OS detection (for Windows / Linux specific settings later)
-- ---------------------------------------------------------------------------
local uname = vim.loop.os_uname()
is_windows = uname.sysname == "Windows_NT"
is_linux = uname.sysname == "Linux"

vim.g.have_nerd_font = true
-- Optional: Windows-friendly shell configuration (PowerShell example)
if is_windows then
  vim.opt.shell = "bash.exe"
  vim.opt.shellcmdflag = "-i -l"
  vim.opt.shellquote = '"'
  vim.opt.shellxquote = ""
end

-- Global Stuff
  vim.g.start_time = vim.fn.reltime()
  vim.loader.enable() --  SPEEEEEEEEEEED 

vim.pack.add({
    {
		src = "https://github.com/ellisonleao/gruvbox.nvim",
		version = vim.version.range('2.0.0'),
    },
	{
		src = "https://github.com/ibhagwan/fzf-lua",
	},
	{
		src = "https://github.com/folke/which-key.nvim",
	},
	{
		src = "https://github.com/romgrk/barbar.nvim",
	},
	{
		src = "https://github.com/nvim-tree/nvim-web-devicons",
	},
	{
		src = "https://github.com/nvim-lualine/lualine.nvim",
    },
    {
		src = "https://github.com/lewis6991/gitsigns.nvim",
    },
	{
		src = "https://github.com/nvim-tree/nvim-tree.lua",
	},
	{
		src = "https://github.com/windwp/nvim-autopairs",
	},
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = 'main',
	},
})

--   Plug("nvim-treesitter/nvim-treesitter")           -- improved syntax
--   Plug("mfussenegger/nvim-lint")                    -- async linter
--   Plug("windwp/nvim-autopairs")                     -- autopairs
--   Plug("numToStr/Comment.nvim")                     -- easier comments
-- ---------------------------------------------------------------------------
-- Load core configuration
-- ---------------------------------------------------------------------------
require("config.keymaps")
require("config.options")
require("config.autocmd")

-- ---------------------------------------------------------------------------
-- Plugin-specific configuration
-- ---------------------------------------------------------------------------
require("plugins.autopairs")
require("plugins.barbar")
require("plugins.colorscheme")
-- require("plugins.comment")
require("plugins.fzf-lua")
require("plugins.gitsigns")
require("plugins.lualine")
-- require("plugins.nvim-lint")
require("plugins.nvim-tree")
require("plugins.treesitter")
require("plugins.which-key")

