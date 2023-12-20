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

" Use only current directory in :tabf
set path=.

let g:onedark_config = { 'style': 'warmer' }
colorscheme onedark

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
autocmd Filetype vim setlocal expandtab tabstop=2 shiftwidth=2 colorcolumn=
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query",
                       "bash", "python", "regex",
                       "make", "terraform",
                       "javascript", "typescript", "tsx", "graphql",
                       "latex", "bibtex",
                       "yaml", "json", "markdown", "markdown_inline",
                       "xml", "html", "css",
                       "git_config", "git_rebase", "gitattributes",
                       "gitcommit", "gitignore" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = {},

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers",
  -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},

    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      -- set to `false` to disable one of the mappings
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF

" Enable folding with tree-sitter (use :za for folding something)
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable 

" Configure lightline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
