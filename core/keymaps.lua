vim.g.mapleader = " "

-- general keymaps
vim.keymap.set("i", "jk", "<ESC>") -- escape insert mode with 

vim.keymap.set("n", "<leader>nh", ":nohl<CR>") -- get rid of highlights

vim.keymap.set("n", "<leader>+", "<C-a>") -- increment number
vim.keymap.set("n", "<leader>-", "<C-x>") -- decrement number

-- window keymaps
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally 
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
vim.keymap.set("n", "<leader>sf", ":resize | vertical resize<CR>") -- full screen the current window

vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

vim.keymap.set("n", "<leader><Left>", "<C-w>h") -- move left a window
vim.keymap.set("n", "<leader><Down>", "<C-w>j") -- move down a window
vim.keymap.set("n", "<leader><Up>", "<C-w>k") -- move up a window
vim.keymap.set("n", "<leader><Right>", "<C-w>l") -- move right a window

vim.keymap.set("n", "<C-x>", ":bd<CR>") -- close current buffer

-- LSP keymaps
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>sd', vim.diagnostic.open_float)

vim.api.nvim_create_augroup("AutoFormatting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "AutoFormatting",
    pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.json" },
    callback = function()
        vim.lsp.buf.format()
    end,
})
