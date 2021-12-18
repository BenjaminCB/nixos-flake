local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;

on_attach = function(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            :hi LspReferenceRead cterm=bold ctermbg=red guibg=#505050
            :hi LspReferenceText cterm=bold ctermbg=red guibg=#505050
            :hi LspReferenceWrite cterm=bold ctermbg=red guibg=#505050
            :hi LspDiagnosticsFloatingHint cterm=bold ctermbg=red guibg=LightYellow
            augroup lsp_document_highlight
                autocmd!
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]], false)
    end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "tsserver"
                , "texlab"
                , "html"
                , "cssls"
                , "hls"
                , "elmls"
                , "purescriptls"
                }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities,
        on_attach = on_attach,
    }
end

nvim_lsp.clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end
}

local pid = vim.fn.getpid()
local hostname = vim.api.nvim_exec([[echo system('hostname')]], true)
local omnisharp_bin

if hostname == "void-desktop\n" then
    omnisharp_bin = "/home/bcb/.omnisharp/run"
else
    omnisharp_bin = "omnisharp"
end

nvim_lsp.omnisharp.setup {
    cmd = { omnisharp_bin,
            "--languageserver",
            "--hostPID",
            tostring(pid) };
}
