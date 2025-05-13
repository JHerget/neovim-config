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

vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- maximize/minimize a window

-- terminal keymaps
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>") -- escape terminal mode
vim.keymap.set("t", "jk", "<C-\\><C-n>") -- escape terminal mode with jk

vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

vim.keymap.set("n", "<leader>st", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)
end)
