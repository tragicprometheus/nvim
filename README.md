## Guide to My NVIM Config

### Quickstart: 
```
cd ~/.config/ && git clone https://github.com/tragicprometheus/nvim
```

**Plugins** 
NOTE: Check a bunch more out here: [Awesome neovim plugins list](https://github.com/rockerBOO/awesome-neovim)

### File Structure
```
~/.config/nvim/
├── init.lua
├── nvim-pack-lock.json
├── README.md (this file)
└── lua
    ├── config
    │   ├── keymaps.lua
    │   ├── options.lua
    │   └── autocmd.lua
    └── plugins
        ├── <plugin-name>.lua
```

### Current Plugins

- ellisonleao/gruvbox.nvim
- ibhagwan/fzf-lua
- folke/which-key.nvim
- romgrk/barbar.nvim
- nvim-tree/nvim-web-devicons
- nvim-lualine/lualine.nvim
- lewis6991/gitsigns.nvim
- nvim-tree/nvim-tree.lua

### Custom Behaviors

- [C-z] to bring up native terminal in new buffer and go directly into insert mode
- when in terminal <Esc><Esc> closes the terminal buffer

### Plugins to look at:

- [code biscuits](https://github.com/code-biscuits/nvim-biscuits)

### Features to Add:

Code support for:
- C
- Lua (obviously)
- Python

LSP, auto-complete, etc.
