---
-- global config
---
local lspconfig = require('lspconfig')
local masonLspConfig = require('mason-lspconfig')
local lsp_defaults = lspconfig.util.default_config

masonLspConfig.setup({
    ensure_installed = {
--        "clangd",
        "lua_ls",
        "pylsp",
    }
})

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

---
-- LSP Servers
---
--lspconfig.lua_ls({capabilities = capabilities})
lspconfig.sumneko_lua.setup({
    settings = {
        lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})
lspconfig.clangd.setup({capabilities = capabilities})
lspconfig.pylsp.setup({
    capabilities = capabilities,
    init_options = {
        usePlaceholders = true
    },
    flags = {
        debounce_text_changes = 75
    },
    pylsp = {
        plugins = {
            pyflakes = {
                ignore = {'E501'},
                maxLineLength = 100,
            }
        }
    }
})

---
-- Diagnostics
---
local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        test = opts.text,
        numhl = ''
    })
end

sign({name = 'DiagnosticSignError', text = 'X'})
sign({name = 'DiagnosticSignWarn', text = '⚠'})
sign({name = 'DiagnosticSignHint', text = '💡'})
sign({name = 'DiagnosticSignInfo', text = 'ℹ'})

vim.diagnostic.config({
    signs = true,
    severity_sort = true,
    underline = true,
    update_in_insert = true,
    float = {
        border = 'rounder',
        source = 'always',
        header = 'Diagnostics:',
        prefix = '',
    },
    virtual_text = {
        source = "always",
        prefix = 'x'
    }
})
