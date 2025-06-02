local state = {
    buf = -1,
    win = -1,
}

function ToggleFloatingTerminal()
    if vim.api.nvim_win_is_valid(state.win) then
        vim.api.nvim_win_hide(state.win)
        return
    end

    if not vim.api.nvim_buf_is_valid(state.buf) then
        state.buf = vim.api.nvim_create_buf(false, true)
    end

    local width = vim.o.columns
    local height = vim.o.lines

    local win_width = math.ceil(width * 0.8)
    local win_height = math.ceil(height * 0.8)
    local row = math.ceil((height - win_height) / 2) - 1
    local col = math.ceil((width - win_width) / 2)

    state.win = vim.api.nvim_open_win(state.buf, true, {
        relative = "editor",
        width = win_width,
        height = win_height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    })

    if vim.bo[state.buf].buftype ~= "terminal" then
        vim.fn.termopen("zsh")
        vim.bo[state.buf].buftype = "terminal"
    end
end

vim.keymap.set("n", "<leader>tt", ":lua ToggleFloatingTerminal()<CR>")

return {}
