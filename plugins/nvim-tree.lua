return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup({
            renderer = {
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "→",
                            arrow_open = "↓"
                        },
                    },
                },
            },
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
        })
    end
}
