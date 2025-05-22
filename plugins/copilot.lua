return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim", branch = "master" },
        "github/copilot.vim",
        "nvim-telescope/telescope-ui-select.nvim"
    },
    build = "make tiktoken",
    config = function()
        require("CopilotChat").setup()
        require("telescope").setup()
        require("telescope").load_extension("ui-select")
    end,
}
