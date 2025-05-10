return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                -- theme = 'gruvbox_light',
                -- theme = 'gruvbox',
                -- theme = 'gruvbox_dark',
                theme = 'everforest',
            },
        })
    end
}
