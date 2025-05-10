-- gcc (linewise)
-- gbc (blockwise)
-- gc{count}{motion}
-- gb{count}{motion}
return {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
