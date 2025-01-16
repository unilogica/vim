let mapleader = '\'

call plug#begin()
" Plugins aqui
Plug 'sainnhe/sonokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
" Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Plug 'dense-analysis/ale'
Plug 'dense-analysis/ale', { 'on': 'ALEEnable' }

Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
" Plug 'neoclide/coc-phpactor'
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}

Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }

" Auto pairs e auto close tags
Plug 'jiangmiao/auto-pairs'
" Plug 'AndrewRadev/tagalong.vim'

" TypeScript
" Plug 'leafgarland/typescript-vim'

" CoffeeScript
" Plug 'kchmck/vim-coffee-script'

" JavaScript
" Plug 'pangloss/vim-javascript'
" Plug 'maxmellon/vim-jsx-pretty'

" Prettifier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'yaml', 'php'] }


"Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}
" Plug 'yaegassy/coc-blade', {'do': 'yarn install --frozen-lockfile'}
" Plug 'yaegassy/coc-laravel', {'do': 'yarn install --frozen-lockfile'}
Plug 'yaegassy/coc-nginx', {'do': 'yarn install --frozen-lockfile'}
" Plug 'MehrAlsNix/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}

Plug 'Yggdroot/indentLine'

" Plug 'markonm/traces.vim'

" if (has("nvim"))
"     Plug 'nvim-lua/plenary.nvim'
"     Plug 'nvim-telescope/telescope.nvim'
"     Plug 'smjonas/live-command.nvim'
"     autocmd VimEnter * lua require("live-command").setup({ 
"         \ commands = { 
"         \   S = { 
"         \     cmd = "Subvert"
"         \   },
"         \   Norm = { 
"         \     cmd = "norm"
"         \   },
"         \ } 
"     \})
"     Plug 'tpope/vim-abolish'
" endif

" if has('nvim')
"     Plug 'smjonas/live-command.nvim'
"     autocmd VimEnter * call luaeval('require("live-command").setup({commands = {S = {cmd = "Subvert"}, Norm = {cmd = "norm"}}})')
"     Plug 'tpope/vim-abolish'
" endif

if (has("nvim"))
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
endif

Plug 'tpope/vim-abolish'

call plug#end()


" Global Sets """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on            " Enable syntax highlight
set nu               " Enable line numbers
set tabstop=4        " Show existing tab with 4 spaces width
set softtabstop=4    " Show existing tab with 4 spaces width
set shiftwidth=4     " When indenting with '>', use 4 spaces width
set expandtab        " On pressing tab, insert 4 spaces
set smarttab         " insert tabs on the start of a line according to shiftwidth
set smartindent      " Automatically inserts one extra level of indentation in some cases
set hidden           " Hides the current buffer when a new file is openned
set incsearch        " Incremental search
set ignorecase       " Ingore case in search
set smartcase        " Consider case if there is a upper case character
set scrolloff=8      " Minimum number of lines to keep above and below the cursor
set colorcolumn=100  " Draws a line at the given line to keep aware of the line size
set signcolumn=yes   " Add a column on the left. Useful for linting
set cmdheight=2      " Give more space for displaying messaiges
set updatetime=100   " Time in miliseconds to consider the changes
set encoding=utf-8   " The encoding should be utf-8 to activate the font icons
set nobackup         " No backup files
set nowritebackup    " No backup files
set splitright       " Create the vertical splits to the right
set splitbelow       " Create the horizontal splits below
set autoread         " Update vim after file update from outside
set mouse=a          " Enable mouse support
" set autochdir        " Your working directory will always be the same as your working directory
filetype on          " Detect and set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
filetype indent on   " Load the indent file for the file type, if any
filetype plugin indent on

set spell spelllang=pt_br " Correcao ortografica para portugues
set nospell          " desliga a correcao por padrao

set clipboard=unnamedplus

" Themes """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_current_word = 'bold'
colorscheme sonokai

if (has("nvim")) "Transparent background. Only for nvim
    highlight Normal guibg=NONE ctermbg=NONE
    highlight EndOfBuffer guibg=NONE ctermbg=NONE
endif

let g:airline_theme = 'sonokai'

" Remaps """"""""""
" remaps aqui
nmap tt :tabe<CR>

" Create splits
nmap ss :split<CR>
nmap vv :vsplit<CR>

" Close splits and others
nmap qq :q<CR>

" CMD+S  => SALVANDO ARQUIVO
map <M-s> :w<kEnter>
imap <M-s> <Esc>:w<kEnter>a

" CMD+C => Copiando buffer
vnoremap <M-c> "+ygv

" CMD+A => Selecionar tudo
nnoremap <M-A>a ggVG

" TAB e SHIFT + TAB => Mover o bloco
vmap <Tab> >gv
vmap <S-Tab> <gv

" Comentarios

map <M-X> gcc
imap <M-X> <Esc>gcca

" CMD + Z => Undo

map <M-Z> u
imap <M-Z> <Esc>ua


" autocmd """"""""""
" autocmds aqui

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType php setlocal ts=4 sts=4 sw=4 iskeyword+=$ commentstring=//\ %s


" YAML  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldlevelstart=20

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'


function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()


" AirLine """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" NerdTree """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <C-a> :NERDTreeToggle<CR>


" ALE """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}

" let g:ale_fixers = {
" \   '*': ['trim_whitespace'],
" \}

let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'javascript': ['eslint', 'prettier'],
    \ 'typescript': ['eslint', 'prettier'],
    \ 'typescriptreact': ['eslint', 'prettier'],
    \ 'php': ['php_cs_fixer', 'phpcbf'],
    \ }


" Instalar um linter para PHP
let g:ale_linters = {
\   'php': ['phpcs', 'phpmd', 'phpstan', 'psalm'],
\}

" Configurar opções específicas para o phpcs
let g:ale_php_phpcs_standard = 'PSR2'

" Configurar php-cs-fixer para auto formatar o código ao salvar o arquivo
let g:ale_php_php_cs_fixer_executable = 'php-cs-fixer'
let g:ale_php_php_cs_fixer_options = '--rules=@PSR2,multiline_function_call'


" Configurações do ALE para TypeScript
let g:ale_typescript_typescript_eslint_options = '--fix'
let g:ale_typescript_react_typescript_eslint_options = '--fix'


" let g:ale_fix_on_save = 1


if (has("nvim"))

    " Telescope """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    nnoremap ff <cmd>Telescope find_files<cr>
    nnoremap fg <cmd>Telescope live_grep<cr>
    nnoremap fb <cmd>Telescope buffers<cr>
    nnoremap fh <cmd>Telescope help_tags<cr>
endif



" COC """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:coc_global_extensions = [ 'coc-snippets', 'coc-explorer', 'coc-phpactor', 'coc-tsserver' ]
let g:coc_global_extensions = [ 'coc-phpactor', 'coc-tsserver' ]

" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes


" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json,typescriptreact,javascript setl formatexpr=CocAction('formatSelected') shiftwidth=2 tabstop=2 softtabstop=2
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



" Coc Snippets """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)


let g:coc_snippet_next = '<tab>'

let g:coc_global_extensions = [ 'coc-snippets', ]

" Coc Explorer """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:nnoremap ee :CocCommand explorer<CR>

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

" Use preset argument to open it
nnoremap <space>ed :CocCommand explorer --preset .vim<CR>
nnoremap <space>ef :CocCommand explorer --preset floating<CR>
nnoremap <space>ec :CocCommand explorer --preset cocConfig<CR>
nnoremap <space>eb :CocCommand explorer --preset buffer<CR>

" List all presets
nnoremap <space>el :CocList explPresets


"  Fix Bug right insert spaces
nnoremap <Right> <Right>
inoremap <Right> <Right>

" The `<c-u>` removes the current visual mode, so a function can be called
xnoremap <buffer> p :<c-u>call <SID>Paste()<cr>

" The <SID> above is the same as the s: here
function! s:Paste()
  call tagalong#Trigger()

  " gv reselects the previously-selected area, and then we just paste
  normal! gvp

  call tagalong#Apply()
endfunction

" Fecha o buffer sem fechar a janela
nnoremap <C-w>! :call DeleteCurBufferNotCloseWindow()<CR>

func! DeleteCurBufferNotCloseWindow() abort
    if &modified
        echohl ErrorMsg
        echom "E89: no write since last change"
        echohl None
    elseif winnr('$') == 1
        bd
    else  " multiple window
        let oldbuf = bufnr('%')
        let oldwin = winnr()
        while 1   " all windows that display oldbuf will remain open
            if buflisted(bufnr('#'))
                b#
            else
                bn
                let curbuf = bufnr('%')
                if curbuf == oldbuf
                    enew    " oldbuf is the only buffer, create one
                endif
            endif
            let win = bufwinnr(oldbuf)
            if win == -1
                break
            else        " there are other window that display oldbuf
                exec win 'wincmd w'
            endif
        endwhile
        " delete oldbuf and restore window to oldwin
        exec oldbuf 'bd'
        exec oldwin 'wincmd w'
    endif
endfunc

" let g:codeium_disable_bindings = 1
let g:codeium_enabled = v:true

imap <script><silent><nowait><expr> <C-g> codeium#Accept()
imap <C-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-x>   <Cmd>call codeium#Clear()<CR>

" CoC PHP LSP

" " Select range based on AST
" nmap <silent><Leader>r <Plug>(coc-range-select)
" xmap <silent><Leader>r <Plug>(coc-range-select)

" " Navigations
" nmap <Leader>o <Plug>(coc-definition)
" nmap <Leader>O <Plug>(coc-type-definition)
" nmap <Leader>I <Plug>(coc-implementation)
" nmap <Leader>R <Plug>(coc-references)

" " List code actions available for the current buffer
" nmap <leader>ca  <Plug>(coc-codeaction)

" " Use <CR> to validate completion (allows auto import on completion)
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" " Hover
nmap <C-K> :call <SID>show_documentation()<CR>

" Mapeia a combinação de teclas CTRL+K para chamar a função show_documentation no modo visual
vmap <C-K> <Esc>:call <SID>show_documentation()<CR>gv

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" " Text objects for functions and classes (uses document symbol provider)
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)
" " autocmd CursorHold * silent call CocActionAsync('highlight')\\


" Mapeamento para mover linhas no modo visual
vnoremap <A-Up> :move '<-2<CR>gv=gv
vnoremap <A-Down> :move '>+1<CR>gv=gv

" Mapeamento para mover linhas no modo normal
nnoremap <A-Up> :m .-2<CR>==
nnoremap <A-Down> :m .+1<CR>==

" Mapeamento para mover linhas no modo de inserção
inoremap <silent> <A-Up> <Esc>:m .-2<CR>==gi
inoremap <silent> <A-Down> <Esc>:m .+1<CR>==gi

" Mapeamento para mover seleção no modo de inserção se houver uma seleção visual ativa
xnoremap <A-Up> :m '<-2<CR>gv=gv
xnoremap <A-Down> :m '>+1<CR>gv=gv

" Option+Shift+Down: Copy the current line/block and move it down
nnoremap <A-S-Down> :t.<CR>==
vnoremap <A-S-Down> y'>p`[v`]=

" Option+Shift+Up: Copy the current line/block and move it up
nnoremap <A-S-Up> :t-1<CR>==
vnoremap <A-S-Up> y'<Esc>kPgv`]=

" Back Hole Register "_ for d not cut text
nnoremap d "_d
vnoremap d "_d

" Configurar um timer para chamar o comando CocRestart a cada hora (3600000 ms)
let g:timer_id = timer_start(3600000, {-> execute('CocRestart')}, {'repeat': -1})


" " COC FIX """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" command! -nargs=* -range CocAction :call coc#rpc#notify('codeActionRange', [, , ])
" command! -nargs=* -range CocFix :call coc#rpc#notify('codeActionRange', [, , 'quickfix'])
command! -nargs=0 CocAction :call coc#rpc#notify('codeActionRange', [line('.'), col('.'), line('.'), col('.')])
command! -nargs=0 CocFix :call coc#rpc#notify('codeActionRange', [line('.'), col('.'), line('.'), col('.'), 'quickfix'])

nnoremap <leader>a :call CocAction('codeAction')<CR>
nnoremap <leader>f :call CocAction('quickfix')<CR>

" " Formataçao / Identacao """"""""""""""""""""""""""""'""""""""""""""""""""""""'""""""""""""""""""""""""

" Configuração do PhpCsFixer para PHP
autocmd BufReadPre,BufNewFile *.php let b:formatter = 'php-cs-fixer'
function! FormatPHP()
    if exists("b:formatter") && b:formatter ==# 'php-cs-fixer'
        " Salva o buffer antes de executar
        silent write
        
        " Caminho completo para o php-cs-fixer
        let l:php_cs_fixer_path = system('which php-cs-fixer')[:-2]
        
        if empty(l:php_cs_fixer_path)
            echohl ErrorMsg
            echom "php-cs-fixer não encontrado no PATH"
            echohl None
            return
        endif
        
        " Caminho do arquivo atual
        let l:file_path = expand('%:p')
        
        " Executa o comando de forma síncrona com regras padrão
        let l:cmd = l:php_cs_fixer_path . 
                    \ ' fix ' . shellescape(l:file_path) . 
                    \ ' --rules=@PSR2' . 
                    \ ' --allow-risky=yes' . 
                    \ ' --using-cache=no'
        
        " Executa o comando
        let l:output = system(l:cmd)
        
        " Verifica erros
        if v:shell_error
            echohl ErrorMsg
            echom "Erro ao executar php-cs-fixer: " . l:output
            echohl None
        else
            " Recarrega o arquivo explicitamente
            edit!
            echo "Formatado com php-cs-fixer"
        endif
    endif
endfunction

" Atalho para formatar manualmente com PhpCsFixer
nnoremap <leader>f :call FormatPHP()<CR>

" Ativar formatação automática ao salvar
augroup PhpCsFixer
    autocmd!
    autocmd BufWritePre *.php call FormatPHP()
augroup END

" Função para executar o Prettier em arquivos JS, JSX, TS e TSX

" Ativar formatação com Prettier ao salvar arquivos JS, JSX, TS e TSX
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx Prettier

" ============
"
"
" Função para destacar padrões em substituições do vim-abolish
"
"

set inccommand=nosplit
