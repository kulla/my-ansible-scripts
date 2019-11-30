set number
set list
set colorcolumn=81

au BufRead,BufNewFile *.tsx setfiletype typescript
au BufRead,BufNewFile *.ts setfiletype typescript
autocmd Filetype typescript setlocal expandtab
autocmd Filetype typescript setlocal tabstop=2
autocmd Filetype typescript setlocal shiftwidth=2

au BufRead,BufNewFile *.yml setfiletype yaml
au BufRead,BufNewFile *.yml setfiletype yaml
autocmd Filetype yaml setlocal expandtab
autocmd Filetype yaml setlocal tabstop=2
autocmd Filetype yaml setlocal shiftwidth=2

au BufRead,BufNewFile *.twig setfiletype twig
autocmd Filetype twig setlocal expandtab
autocmd Filetype twig setlocal tabstop=2
autocmd Filetype twig setlocal shiftwidth=2
