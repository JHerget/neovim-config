return {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets'
    },
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()

        local cmp = require('cmp')

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },
            mapping = {
                ["<C-n>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-o>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-e>"] = cmp.mapping.scroll_docs(-4),
                ["<C-i>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestion
                ["<C-e>"] = cmp.mapping.abort(), -- close completion window 
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip'  },
                { name = 'vsnip'    },
                { name = 'buffer'   },
                { name = 'path'     },
                -- { name = 'cmdline'  },
            }, {
                { name = 'buffer' },
            })
        })
    end
}
