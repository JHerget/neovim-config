local on_attach = function(client, bufnr)
    local function bufmap(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = 'LSP: ' .. desc })
    end

    -- Go-to & Peek
    bufmap('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
    bufmap('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
    bufmap('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
    bufmap('n', 'gr', vim.lsp.buf.references, 'List references')

    -- Hover & Signature Help
    bufmap('n', 'K',  vim.lsp.buf.hover, 'Hover documentation')
    bufmap('i', '<C-h>', vim.lsp.buf.signature_help, 'Signature help')

    -- Code Actions & Rename
    bufmap('n', '<leader>ca', vim.lsp.buf.code_action, 'Code action')
    bufmap('n', '<leader>rn', vim.lsp.buf.rename, 'Rename symbol')

    -- Diagnostics Navigation
    bufmap('n', '[d', vim.diagnostic.goto_prev, 'Previous diagnostic')
    bufmap('n', ']d', vim.diagnostic.goto_next, 'Next diagnostic')
    bufmap('n', '<leader>e', vim.diagnostic.open_float, 'Show diagnostics')
    bufmap('n', '<leader>q', vim.diagnostic.setloclist, 'Diagnostics to loclist')

    -- Workspace Folder Management
    bufmap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, 'Add workspace folder')
    bufmap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Remove workspace folder')
    bufmap('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, 'List workspace folders')
end

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()

        require("mason").setup({
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            },
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                "csharp_ls",
                "dockerls",
                "jsonls",
                "grammarly",
                "bashls",
                "sqlls",
                "terraformls",
                "eslint",
                "ts_ls",
                "pyright",
                "html",
                "cssls",
                "intelephense",
                "yamlls",
                "lua_ls",
                "ocamllsp",
            },
            automatic_installation = true,
        })

        require("lspconfig").sourcekit.setup({
            capabilities = {
                workspace = {
                    didChangeWatchedFiles = {
                        dynamicRegistration = true
                    }
                }
            }
        })

        vim.diagnostic.config({
            update_in_insert = true,
            virtual_text = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
