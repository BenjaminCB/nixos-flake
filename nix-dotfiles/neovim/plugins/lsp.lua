local nvim_lsp = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
}

local servers = { "ts_ls"
                , "hls"
                , "lua_ls"
                , "pylsp"
                , "yamlls"
                , "nixd"
                , "coq_lsp"
                }

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities,
        handlers = handlers,
    }
end
