return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim", branch = "master" },
        "nvim-telescope/telescope.nvim",
        "github/copilot.vim",
    },
    build = "make tiktoken",
    config = function()
        require("CopilotChat").setup()
    end,
}
