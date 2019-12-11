filetype indent plugin on
syntax on

let g:deoplete#enable_at_startup = 1

set number
set hlsearch ignorecase smartcase
set nobackup

set colorcolumn=81
if (has("termguicolors"))
  set termguicolors
endif

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

au BufRead,BufNewFile *.tsx set filetype=typescript.tsx
au BufRead,BufNewFile *.ts set filetype=typescript
au BufRead,BufNewFile *.twig set filetype=twig

autocmd Filetype typescript,yaml,twig,markdown,javascript,json,php setlocal expandtab
autocmd Filetype typescript,yaml,twig,markdown,javascript,json setlocal tabstop=2 shiftwidth=2
autocmd Filetype php setlocal tabstop=4 shiftwidth=4

autocmd Filetype markdown,latex setlocal colorcolumn=
