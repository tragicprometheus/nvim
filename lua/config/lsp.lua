-- Set default root markers for all clients
vim.lsp.config('*', {
		root_markers = { '.git' }
})


-- Configurations

-- C/C++ (clangd)
vim.lsp.config('clangd', {
		cmd = 'clangd',
		root_markers = { '.clangd', 'compile_commands.json' },
		filetypes = { 'c', 'cpp' },
})
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = {'c', 'cpp'},
--   callback = function()
--     vim.lsp.start({
--       name = 'clangd',
--       cmd = {'clangd'},
--       root_dir = vim.fs.dirname(vim.fs.find({'compile_commands.json', '.git'}, { upward = true })[1]),
--     })
--   end,
-- })

-- C# (omnisharp)
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'cs',
--   callback = function()
--     vim.lsp.start({
--       name = 'omnisharp',
--       cmd = {'omnisharp', '--languageserver'},  -- Adjust path if needed
--       root_dir = vim.fs.dirname(vim.fs.find({'*.sln', '*.csproj', '.git'}, { upward = true })[1]),
--     })
--   end,
-- })

-- Python (pylsp)
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'python',
--   callback = function()
--     vim.lsp.start({
--       name = 'pylsp',
--       cmd = {'pylsp'},
--       root_dir = vim.fs.dirname(vim.fs.find({'pyproject.toml', 'setup.py', '.git'}, { upward = true })[1]),
--     })
--   end,
-- })

-- Bash
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = {'sh', 'bash'},
--   callback = function()
--     vim.lsp.start({
--       name = 'bashls',
--       cmd = {'bash-language-server', 'start'},
--       root_dir = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true })[1]),
--     })
--   end,
-- })

-- Lua
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'lua',
--   callback = function()
--     vim.lsp.start({
--       name = 'lua_ls',
--       cmd = {'lua-language-server'},  -- Adjust path if needed
--       root_dir = vim.fs.dirname(vim.fs.find({'.luarc.json', '.git'}, { upward = true })[1]),
--       settings = {
--         Lua = {
--           runtime = { version = 'LuaJIT' },
--           diagnostics = { globals = {'vim'} },
--           workspace = { library = vim.api.nvim_get_runtime_file("", true) },
--         },
--       },
--     })
--   end,
-- })

-- Enable Configs
vim.lsp.enable('clangd')
vim.lsp.enable('lua')
