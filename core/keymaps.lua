vim.g.mapleader = " "

-- general keymaps
vim.keymap.set("n", "x", "_x") -- remove character but don't save it to the buffer

vim.keymap.set("i", "jk", "<ESC>") -- escape insert mode with 

vim.keymap.set("n", "<leader>nh", ":nohl<CR>") -- get rid of highlights

vim.keymap.set("n", "<leader>+", "<C-a>") -- increment number
vim.keymap.set("n", "<leader>-", "<C-x>") -- decrement number

-- window keymaps
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally 
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

vim.keymap.set("n", "<leader><Left>", "<C-w>h") -- move left a window
vim.keymap.set("n", "<leader><Down>", "<C-w>j") -- move down a window
vim.keymap.set("n", "<leader><Up>", "<C-w>k") -- move up a window
vim.keymap.set("n", "<leader><Right>", "<C-w>l") -- move right a window

-- plugin keymaps
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- maximize/minimize a window
vim.keymap.set("n", "<leader>e" ,":NvimTreeToggle<CR>") -- open/close file tree

local builtin = require('telescope.builtin')
vim.keymap.set("n", "<C-p>", builtin.find_files) -- search files
vim.keymap.set("n", "<leader>fg", builtin.live_grep) -- search for a string in the cwd
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
vim.keymap.set("n", "<leader>en", function() -- find files in the nvim config directory
    builtin.find_files { cwd = vim.fn.stdpath("config") }
end)
vim.keymap.set("n", "<leader>fc", builtin.grep_string) -- search files for the selected string
