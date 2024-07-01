local nvim_lsp = require("lspconfig")

-- Add borders to LSP windows
require("lspconfig.ui.windows").default_options.border = border

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

local servers = { "tsserver"
                , "hls"
                , "lua_ls"
                , "pylsp"
                , "yamlls"
                , "nixd"
                }

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities,
        handlers = handlers,
    }
end
