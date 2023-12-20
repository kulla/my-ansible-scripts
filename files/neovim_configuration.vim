filetype indent plugin on
syntax on

" Disable vi-compatibily mode
set nocompatible

set number
set signcolumn=yes
set hlsearch ignorecase smartcase
" Needed for plugin coc (switching of buffers without saving is possible)
set hidden
set nobackup
set nowritebackup
set colorcolumn=81

colorscheme gruvbox

" Add a callback to plugin fugtive to update eleline (see
" https://github.com/liuchengxu/eleline.vim)
autocmd User FugitiveChanged if exists("b:eleline_branch") | unlet b:eleline_branch | endif

" Go to previous tab instead of next tab when a tab is closed
autocmd TabClosed * if expand('<afile>') <= tabpagenr("$") | tabp | endif

command! -nargs=0 Prettier :CocCommand prettier.formatFile

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> da :<C-u>CocList diagnostics<cr>
nmap <silent> dp <Plug>(coc-diagnostic-prev)
nmap <silent> dn <Plug>(coc-diagnostic-next)
nmap <silent> di <Plug>(coc-diagnostic-info)
nmap <silent> df <Plug>(coc-fix-current)

vmap <leader>f <Plug>(coc-format)
nmap <leader>f <Plug>(coc-format)
nmap <leader>r <Plug>(coc-rename)

nmap <silent> ci <Plug>(coc-implementation)
nmap <silent> ct <Plug>(coc-type-definition)
nmap <silent> cd <Plug>(coc-definition)
nmap <silent> cr <Plug>(coc-references)

nmap <silent> gu :<C-u>CocCommand git.chunkUndo<cr>
nmap <silent> gs :<C-u>CocCommand git.chunkStage<cr>
nmap <silent> gd :<C-u>CocCommand git.diffCached<cr>
nmap <silent> gb :<C-u>CocCommand git.browserOpen<cr>
nmap <silent> gr :<C-u>CocCommand git.refresh<cr>

set updatetime=300

" Show documentation on key K
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

set autoindent
set tabstop=4 shiftwidth=4

" Make trainling spaces and tabs visible
set list listchars=tab:>.,trail:%

set wrap linebreak

" Show long lines also partially (https://vi.stackexchange.com/q/102)
set display+=lastline

" Remap keys so that vim navigates smoothly in wrapped files
nnoremap <Down> gj
nnoremap <Up> gk

" See https://github.com/neoclide/coc-prettier/issues/127
let g:coc_filetype_map = { 'markdown.mdx': 'mdx' }

autocmd BufEnter *.mdx setlocal filetype=markdown.mdx

autocmd Filetype bash setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype dockerfile setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype javascriptreact setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype json setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype latex setlocal colorcolumn=
autocmd Filetype markdown setlocal expandtab tabstop=2 shiftwidth=2 colorcolumn=
autocmd Filetype markdown.mdx setlocal expandtab tabstop=2 shiftwidth=2 colorcolumn=
autocmd Filetype rst setlocal expandtab tabstop=2 shiftwidth=2 colorcolumn=
autocmd Filetype rust setlocal colorcolumn=101
autocmd Filetype sh setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype taskedit setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype typescriptreact setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype typescript setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype tf setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype terraform setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype vim setlocal colorcolumn=
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
