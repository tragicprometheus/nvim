## Guide to My NVIM Config

### Quickstart: 
```
cd ~/.config/ && git clone https://github.com/BreadOnPenguins/nvim
```
- On first boot, run `:PlugInstall` to ensure all plugins are installed and updated with [vim-plug](https://github.com/junegunn/vim-plug)
- Key maps are in `lua/config/mappings.lua`
    * **Leader is bound to space**, you can press space by itself for which-key to pop up with bindings info
- Neovim options are set in `lua/config/options.lua` with some comments for info
- All plugin configuration is located in the `lua/plugins/` folder
    * To add or remove plugins, modify the `Plug()` section in `init.lua` appropriately, and ensure to modify `require()` as needed for configuration.
    * Then run `:PlugInstall` to install or `:PlugClean` to uninstall

> [!NOTE] to actually use the startup screen, you cannot open nvim to a directory!
<br>

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
