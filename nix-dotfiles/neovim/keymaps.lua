vim.g.mapleader = " "

local wk = require("which-key")

wk.register({
    c = {
        name = "Quickfix",
        n = { "<cmd>cnext<cr>", "Next" },
        p = { "<cmd>cprev<cr>", "Previous" },
        o = { "<cmd>copen<cr>", "Open" },
        c = { "<cmd>cclose<cr>", "Close" },
        f = { ":call setqflist([])<cr>", "Flush" },
    },
    l = {
        name = "Local Quickfix",
        n = { "<cmd>lnext<cr>", "Next" },
        p = { "<cmd>lprev<cr>", "Previous" },
        o = { "<cmd>lopen<cr>", "Open" },
        c = { "<cmd>lclose<cr>", "Close" },
    },
    p = {
        name = "Telescope",
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        t = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        l = { "<cmd>Telescope lsp_references<cr>", "LSP References" },
        s = { "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep for > \")})<cr>", "Grep String" },
    },
    m = {
        name = "Markdown",
        p = { "<cmd>MarkdownPreview<cr>", "Preview" },
    },
    o = {
        name = "Coqtail",
        s = { "<cmd>CoqStart<cr>", "Start" },
        q = { "<cmd>CoqStop<cr>", "Stop" },
        i = { "<cmd>CoqInterrupt<cr>", "Interrupt" },
        j = { "<cmd>CoqNext<cr>", "Next" },
        k = { "<cmd>CoqUndo<cr>", "Undo" },
        l = { "<cmd>CoqToLine<cr>", "To Line" },
        t = { "<cmd>CoqToTop<cr>", "To Top" },
        G = { "<cmd>CoqJumpToEnd<cr>", "Jump to End" },
        E = { "<cmd>CoqJumpToError<cr>", "Jump to Error" },
        gd = { "<cmd>CoqGoToDef[!]<arg>", "Go to Definition" },
        r = { "<cmd>CoqRestorePanels<cr>", "Restore Panels" },
    },
    v = {
        name = "Lsp",
        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
        i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
        sh = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
        rr = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
        rn = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
        ca = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        sd = { "<cmd>lua vim.lsp.util.show_line_diagnostics()<cr>", "Show Line Diagnostics" },
        n = { "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "Next Diagnostic" },
        ll = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Set Loclist" },
    },
    x = {
        name = "Trouble",
        x = { "<cmd>TroubleToggle<cr>", "Trouble" },
        w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
        d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
    },
    g = {
        name = "ChatGPT",
        p = {
            "<cmd>ChatGPT<cr>",
            "Prompt",
        },
    }
}, {
    prefix = "<leader>",
    mode = "n",
})

wk.register({
    g = {
        name = "ChatGPT",
        c = {
            "<cmd>ChatGPTEditWithInstructions<cr>",
            "Edit with instructions",
        },
    },
}, {
    prefix = "<leader>",
    mode = "v",
})
