" markdown preview
nnoremap <leader>mp :MarkdownPreview<cr>

function OpenMarkdownPreview (url)
    execute "silent ! firefox --new-window " . a:url
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'
