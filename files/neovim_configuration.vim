filetype indent plugin on
syntax on

let g:deoplete#enable_at_startup = 1

set number
set ignorecase
set smartcase
set nobackup

set hlsearch
set colorcolumn=81
if (has("termguicolors"))
  set termguicolors
endif

set autoindent
set tabstop=4
set shiftwidth=4
set list
set listchars=tab:>.,trail:%

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

autocmd Filetype typescript,yaml,twig setlocal expandtab
autocmd Filetype typescript,yaml,twig setlocal tabstop=2
autocmd Filetype typescript,yaml,twig setlocal shiftwidth=2
