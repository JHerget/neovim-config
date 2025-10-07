# JHerget NeoVim Configuration 

## Install
1. Clone the repo
```
mkdir -p ~/.config/nvim/lua
cd ~/.config/nvim/lua
git clone https://github.com/JHerget/neovim-config.git
```

2. Install Dependencies
    * [Install brew](https://brew.sh/)
    * `brew install ripgrep`
    * `brew install cmake`
    * `brew install tree-sitter-cli`

3. Install Hack nerd font (optional)

## Setup
1. In `~/.config/nvim/` create a file `init.lua` that contains:
```
require('neovim-config.plugins-setup')
require('neovim-config.core.options')
require('neovim-config.core.keymaps')
```

2. Set NeoVim as Default Git Editor (optional)
```
git config --global core.editor "nvim"
```
