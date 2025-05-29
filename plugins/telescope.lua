return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
    			'nvim-telescope/telescope-fzf-native.nvim',
    	   		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
		},
	},
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set("n", "<C-p>", builtin.find_files) -- search files
        vim.keymap.set("n", "<C-/>", builtin.live_grep) -- search for a string in the cwd
        vim.keymap.set("n", "<C-b>", builtin.buffers)
        vim.keymap.set("n", "<leader>fh", builtin.help_tags)
        vim.keymap.set("n", "<leader>en", function() -- find files in the nvim config directory
            builtin.find_files { cwd = vim.fn.stdpath("config") }
        end)
        vim.keymap.set("n", "<leader>fc", builtin.grep_string) -- search files for the selected string
    end,
}
