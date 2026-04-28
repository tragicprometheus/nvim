return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function ()
    local treesitter = require("nvim-treesitter")
    treesitter.setup()

	treesitter.install = { "bash", "c", "csharp", "css", "cpp", "go", "html", "json", "lua", "markdown", "markdown_inline", "python", "rust", "tsx", "typescript" },

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { "bash", "c", "css", "cpp", "csharp", "go", "html", "json", "lua", "markdown", "markdown_inline", "python", "rust", "tsx", "typescript" },

      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end
 }
