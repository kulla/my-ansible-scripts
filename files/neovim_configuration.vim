filetype indent plugin on
syntax on

set number
set signcolumn=yes
set hlsearch ignorecase smartcase
set hidden " Needed for plugin coc
set nobackup
set nowritebackup

set colorcolumn=81
colorscheme gruvbox
let g:airline_theme = 'gruvbox'

let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format)
nmap <leader>f  <Plug>(coc-format)
nmap <leader>r <Plug>(coc-rename)
nmap <leader>d <Plug>(coc-diagnostic-info)
nmap <leader>i <Plug>(coc-implementation)
nmap <leader>t <Plug>(coc-type-definition)
nmap <leader>c <Plug>(coc-fix-current)
nmap <leader>b <Plug>(coc-definition)
set updatetime=300

set autoindent
set tabstop=4 shiftwidth=4
set list listchars=tab:>.,trail:%

set wrap linebreak
" Show long lines also partially (https://vi.stackexchange.com/q/102)
set display+=lastline

" Remap keys so that vim navigates smoothly in wrapped files
noremap  <buffer> <silent> <Up>   gk
noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g<Home>
noremap  <buffer> <silent> <End>  g<End>
inoremap <buffer> <silent> <Up>   <C-o>gk
inoremap <buffer> <silent> <Down> <C-o>gj
inoremap <buffer> <silent> <Home> <C-o>g<Home>
inoremap <buffer> <silent> <End>  <C-o>g<End>

autocmd Filetype typescript setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype json setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype markdown setlocal expandtab tabstop=2 shiftwidth=2

autocmd Filetype markdown setlocal colorcolumn=
autocmd Filetype latex setlocal colorcolumn=
