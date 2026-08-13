-- Set default root markers for all clients
vim.lsp.config('*', {
    root_markers = { '.git' }
})

-- Configurations

-- C/C++ (clangd)
vim.lsp.config('clangd', {
    cmd = 'clangd',
    filetypes = {'c', 'cpp'},
})

-- C#
vim.lsp.config('omnisharp', {
    cmd = 'omnisharp'
})
vim.lsp.config('clang-format', {
    cmd = 'clang-format'
})
vim.lsp.config('csharpier', {
    cmd = 'csharpier'
})

-- Lua
vim.lsp.config('lua_ls', {
   -- Command and arguments to start the server.
   cmd = { 'lua-language-server' },
   -- Filetypes to automatically attach to.
   filetypes = { 'lua' },
   -- Sets the "workspace" to the directory where any of these files is found.
   -- Files that share a root directory will reuse the LSP server connection.
   -- Nested lists indicate equal priority, see |vim.lsp.Config|.
   root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
   -- Specific settings to send to the server. The schema is server-defined.
   -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
   settings = {
     Lua = {
       runtime = {
         version = 'LuaJIT',
       }
     }
   }
})

-- Basic LSP settings
vim.didChangeWatchedFiles = true
vim.lsp.inline_completion.enable()

-- Enable
vim.lsp.enable({
    'lua_ls',
    'clangd',
    -- 'pyright',
    'omnisharp',
    'csharpier',
    'clang-format'
})

