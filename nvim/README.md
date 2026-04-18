# Neovim Setup with Lazy.vim

## 🚀 Installation

1. Clone the repository:

```bash

```

2. Move nvim directory to:

- **Windows**: `$env:LOCALAPPDATA\+`

- **Linux**: `~/.config/`

## ⚙ Requirements

- Neovim >= v0.10.0
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
- NodeJS with npm
- [Lazy.vim](https://github.com/folke/lazy.nvim)
- [Git](https://git-scm.com/downloads)

## 📚 Project Structure

```
📂 nvim/
├── 📂 lua/📂 dungqt/
│	 └── 📂 plugins/
│        └── 📂 lsp/
│        └── ...plugins configfiles
│	 └── 🌑 settings.lua
│	 └── 🌑 maps.lua
│    └── 🌑 lazy.lua
└── 🌑 init.lua
```

### ✨ Features

- [folke/lazy.nvim](https://github.com/folke/lazy.nvim): A modern plugin manager for Neovim
- [nvim-neo-tree/neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim): Neovim plugin to manage the file system and other tree like structures.
- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): lua fork of vim-web-devicons for neovim.
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): A blazing fast and easy to configure neovim statusline plugin written in pure lua.
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag): Use treesitter to auto close and auto rename html tag.
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Quickstart configs for Nvim LSP
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp): A completion plugin for neovim coded in Lua.
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim): Portable package manager for Neovim that runs everywhere Neovim runs.
- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim): A neovim lua plugin to help easily manage multiple terminal windows.
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): Git integration for buffers.
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs): Autopairs for neovim written by lua.
- [williamboman/mason-lspconfig.nvim:](https://github.com/williamboman/mason-lspconfig.nvim) Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
