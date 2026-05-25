-- Set default root markers for all clients
vim.lsp.config('*', {
		root_markers = { '.git' }
})


-- Configurations

-- C/C++ (clangd)
vim.lsp.config('clangd', {
		cmd = 'clangd',
		root_markers = { '.clangd', 'compile_commands.json'},
		filetypes = { 'c', 'cpp' },
})

-- C#
-- vim.lsp.config('csharp-ls')

-- Lua
vim.lsp.config('lua_ls', {
		cmd = 'lua_ls',
})

-- Enable
vim.lsp.enable({
		'lua_ls',
		'clangd',
		'pyright',
		'bashls',
		-- 'csharp-ls',
})
