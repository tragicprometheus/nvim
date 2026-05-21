--useful stuff

-- close nvim-tree if it's last buffer open
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		if #vim.api.nvim_list_bufs() == 1 and vim.bo.filetype == "NvimTree" then
	vim.cmd("quit")
	end
	end,
})


-- auto-create missing dirs when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
	local dir = vim.fn.expand("<afile>:p:h")
	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
	end
end,
})


-- linting when file is written to
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   callback = function()
--     -- try_lint without arguments runs the linters defined in `linters_by_ft`
--     -- for the current filetype, on write
--     require("lint").try_lint()
--   end,
-- })


-- spellcheck in md
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	command = "setlocal spell wrap",
})


-- disable automatic comment on newline
vim.api.nvim_create_autocmd("FileType", {
		pattern = "*",
		callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
		end,
})


-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
	vim.highlight.on_yank({ timeout = 300 })
	end,
})


-- reload files on external change
vim.api.nvim_create_autocmd("FocusGained", {
	pattern = "*",
	command = "checktime",
})


-- -- check file size on buffer read
-- vim.api.nvim_create_autocmd({'BufReadPre', 'FileReadPre'}, {
--   pattern = '*',
--   callback = disable_features_for_large_files,
--   desc = 'Disable features for large files'
-- })
--
-- -- ---------------------------------------------------------------------------
-- -- Disable syntax highlighting and linting for large files
-- -- ---------------------------------------------------------------------------
-- local function disable_features_for_large_files()
--   local max_filesize = 100 * 1024 -- 100 KB
--   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
--
--   if ok and stats and stats.size > max_filesize then
--     -- Disable syntax highlighting
--     vim.cmd('syntax off')
--     vim.opt_local.syntax = 'off'
--
--     -- Disable tree-sitter if available
--     if vim.treesitter and vim.treesitter.stop then
--       pcall(vim.treesitter.stop)
--     end
--
--     -- Disable LSP for this buffer
--     vim.diagnostic.disable(0)
--     vim.defer_fn(function()
--       vim.cmd('LspStop')
--     end, 100)
--
--     -- Disable other performance-heavy features
--     vim.opt_local.swapfile = false
--     vim.opt_local.foldmethod = 'manual'
--     vim.opt_local.undolevels = -1
--
--     -- Notify user
--     vim.notify('Large file detected. Syntax highlighting and linting disabled.', vim.log.levels.WARN)
--   end
-- end
--
-- restore cursor pos on file open
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
	local line = vim.fn.line("'\"")
	if line > 1 and line <= vim.fn.line("$") then
		vim.cmd("normal! g'\"")
	end
end,
})

-- Measures startup time
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local startuptime = vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))
    vim.g.startup_time_ms = string.format("%.2f ms", startuptime * 1000)
  end,
})

-- Sets line numbers to be relative when not in insert mode
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
   pattern = "*",
   group = augroup,
   callback = function()
      if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
         vim.opt.relativenumber = true
      end
   end,
})

-- Sets line numbers to be absolute when in insert mode, or when focus is lost
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
   pattern = "*",
   group = augroup,
   callback = function()
      if vim.o.nu then
         vim.opt.relativenumber = false
         -- Conditional taken from https://github.com/rockyzhang24/dotfiles/commit/03dd14b5d43f812661b88c4660c03d714132abcf
         -- Workaround for https://github.com/neovim/neovim/issues/32068
         if not vim.tbl_contains({"@", "-"}, vim.v.event.cmdtype) then
            vim.cmd "redraw"
         end
      end
   end,
})

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time. TODO: Check this
  vim.opt.clipboard = 'unnamedplus'
