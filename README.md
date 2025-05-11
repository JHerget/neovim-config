# JHerget NeoVim Configuration 

## Install
1. Clone the repo
```
mkdir -p ~/.config/nvim/lua
cd ~/.config/nvim/lua
git clone https://github.com/JHerget/neovim-config.git
```

2. Install Hack nerd font (optional)

## Setup
1. Import files in `init.lua`
```
require('jherget.plugins-setup')
require('jherget.core.options')
require('jherget.core.keymaps')
```
