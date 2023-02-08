local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;

on_attach = function(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Set autocommands conditional on server_capabilities
    -- if client.server_capabilities.document_highlight then
    --     vim.api.nvim_exec([[
    --         :hi LspReferenceRead cterm=bold ctermbg=red guibg=#505050
    --         :hi LspReferenceText cterm=bold ctermbg=red guibg=#505050
    --         :hi LspReferenceWrite cterm=bold ctermbg=red guibg=#505050
    --         :hi LspDiagnosticsFloatingHint cterm=bold ctermbg=red guibg=LightYellow
    --         augroup lsp_document_highlight
    --             autocmd!
    --             autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    --             autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    --         augroup END
    --     ]], false)
    -- end
    if client.server_capabilities.documentHighlightProvider then
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
                , "texlab"
                , "html"
                , "cssls"
                , "hls"
                , "elmls"
                , "purescriptls"
                , "sumneko_lua"
                , "pylsp"
                , "yamlls"
                }

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities,
        on_attach = on_attach,
    }
end

-------- c lsp
nvim_lsp.clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end
}

-------- c# lsp

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

-------- scala lsp
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt", "java" },
    callback = function()
        metals_config = require("metals").bare_config()
        metals_config.init_options.statusBarProvider = "on"
        require("metals").initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
})
