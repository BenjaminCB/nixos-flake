vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }

local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;

on_attach = function(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    if client.server_capabilities.documentHighlightProvider then
        vim.cmd [[
            hi! LspReferenceRead cterm=bold ctermbg=235 guibg=Black
            hi! LspReferenceText cterm=bold ctermbg=235 guibg=Black
            hi! LspReferenceWrite cterm=bold ctermbg=235 guibg=Black
        ]]
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = vim.lsp.buf.document_highlight,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Document Highlight",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Clear All the References",
        })
    end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

-------- server setups

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "tsserver"
                , "hls"
                , "lua_ls"
                , "pylsp"
                , "yamlls"
                , "rnix"
                }

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        on_attach = on_attach,
    }
end
