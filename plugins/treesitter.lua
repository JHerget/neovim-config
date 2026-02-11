local langs = {
     "bash",
     "c_sharp",
     "css",
     "csv",
     "dockerfile",
     "go",
     "html",
     "http",
     "javascript",
     "json",
     "lua",
     "php",
     "python",
     "regex",
     "sql",
     "swift",
     "typescript",
     "yaml"
 }

return {
     "nvim-treesitter/nvim-treesitter",
     lazy = false,
     build = ":TSUpdate",
     config = function()
         require("nvim-treesitter").setup({
             ensure_installed = langs,
             sync_install = false,
             auto_install = true,
             highlight = {
                 enable = true,
                 disable = function(lang, buf)
                     local max_filesize = 100 * 1024 -- 100 KB
                     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                     if ok and stats and stats.size > max_filesize then
                         return true
                     end
                 end,
                 additional_vim_regex_highlighting = false,
             },
         })

        vim.api.nvim_create_autocmd("FileType", {
          pattern = langs,
          callback = function(args)
            pcall(vim.treesitter.start, args.buf)
          end,
        })
     end
 }
