# JHerget NeoVim Configuration 

## Install
1. Clone the repo
```
mkdir -p ~/.config/nvim/lua
cd ~/.config/nvim/lua
git clone https://github.com/JHerget/neovim-config.git
```

2. Install Dependencies
```
brew install ripgrep
```

3. Install Hack nerd font (optional)

## Setup
1. Import files in `init.lua`
```
require('jherget.plugins-setup')'
require('jherget.core.options')
require('jherget.core.keymaps')
```

2. Setup GitHub Copilot
    * In NeoVim, setup Copilot
        ```
        :Copilot setup
        ```
    * Install [Node.js](https://nodejs.org/en/download/) (if not already installed)

3. Set NeoVim as Default Git Editor (optional)
```
git config --global core.editor "nvim"
```
