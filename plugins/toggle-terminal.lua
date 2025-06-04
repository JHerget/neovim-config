local state = {
    win = {
        floating = -1,
        standard = -1,
    },
    buf = {
        floating = -1,
        standard = -1,
    },
}

function ToggleFloatingTerminal()
    if vim.api.nvim_win_is_valid(state.win.floating) then
        vim.api.nvim_win_hide(state.win.floating)
        return
    end

    if not vim.api.nvim_buf_is_valid(state.buf.floating) then
        state.buf.floating = vim.api.nvim_create_buf(false, true)
    end

    local width = vim.o.columns
    local height = vim.o.lines

    local win_width = math.floor(width * 0.8)
    local win_height = math.floor(height * 0.8)
    local win_row = math.floor((height - win_height) / 2)
    local win_col = math.floor((width - win_width) / 2)

    state.win.floating = vim.api.nvim_open_win(state.buf.floating, true, {
        relative = "editor",
        width = win_width,
        height = win_height,
        row = win_row,
        col = win_col,
        style = "minimal",
        border = "rounded",
    })

    if vim.bo[state.buf.floating].buftype ~= "terminal" then
        vim.fn.termopen("zsh")
        vim.bo[state.buf.floating].buftype = "terminal"
    end
end

function ToggleStandardTerminal()
    if vim.api.nvim_win_is_valid(state.win.standard) then
        vim.api.nvim_win_hide(state.win.standard)
        return
    end

    if not vim.api.nvim_buf_is_valid(state.buf.standard) then
        state.buf.standard = vim.api.nvim_create_buf(false, true)
    end

    vim.cmd("keepalt vsplit")
    state.win.standard = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(state.win.standard, state.buf.standard)

    if vim.bo[state.buf.standard].buftype ~= "terminal" then
        vim.fn.termopen("zsh")
    end

    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)
end

vim.api.nvim_create_user_command("ToggleTerminal", ToggleStandardTerminal, {})
vim.api.nvim_create_user_command("ToggleFloatingTerminal", ToggleFloatingTerminal, {})

vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>") -- escape terminal mode
vim.keymap.set("t", "jk", "<C-\\><C-n>") -- escape terminal mode with jk
vim.keymap.set("n", "<leader>tt", ":ToggleTerminal<CR>")
vim.keymap.set("n", "<leader>tf", ":ToggleFloatingTerminal<CR>")

return {}
