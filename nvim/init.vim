" vim:fdm=marker
" Plugins {{{
call plug#begin(stdpath('data') . '/plugged')
  Plug 'arcticicestudio/nord-vim'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'itchyny/lightline.vim'
  Plug 'bling/vim-bufferline'

  Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdtree' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin'

  Plug 'airblade/vim-gitgutter'
  Plug 'neoclide/coc.nvim'
  Plug 'sheerun/vim-polyglot'
  Plug 'qpkorr/vim-bufkill'
  Plug 'itchyny/vim-gitbranch'
  Plug 'voldikss/vim-floaterm'
  Plug 'kamykn/popup-menu.nvim'
  Plug 'APZelos/blamer.nvim'
  Plug 'machakann/vim-sandwich'
  Plug 'matze/vim-move'

  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-ui'
call plug#end()

" Move {{{
let g:move_key_modifier = 'C'
" }}}
" Blamer {{{
let g:blamer_enabled = 1
let g:blamer_template = '<author> | <author-time> | <summary> | #<commit-short>'
" }}}
" Lightline {{{
 set noshowmode
 autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
 let g:lightline = {
       \ 'colorscheme': 'nord',
       \ 'active': {
       \   'left': [ [ 'mode', 'paste' ],
       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
       \ },
       \ 'component_function': {
       \   'gitbranch': 'gitbranch#name',
       \   'filetype': 'MyFiletype',
       \   'fileformat': 'MyFileformat',
       \ },
       \ 'tab_component_function': {
       \   'tabnum': 'LightlineWebDevIcons',
       \ },
       \ }
function! LightlineWebDevIcons(n)
  let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
" }}}
" FZF {{{
 let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'yoffset': 0.1, 'xoffset': 0.5, 'border': "sharp" } }
" let g:fzf_layout = { 'down': '20%' }
set rtp+=/usr/local/opt/fzf
" }}}
" COC {{{
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ ]
" Coc settings {{{

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" }}}}}}}}}
" Settings {{{
set splitright

colorscheme nord

" terminal emulator capable of displaying 256 colors
set t_Co=256

" use spaces instead of tabs
set expandtab
set tabstop=2
set shiftwidth=2

" show numbers on the left
set number

" highlight current row
set cursorline

" Give more space for displaying messages.
set cmdheight=2
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" allow hidden buffers
set hidden

" match os clipboard with vim
set clipboard=unnamedplus
set inccommand=split

" Show leading whitespace that includes spaces, and trailing whitespace.
highlight ExtraWhitespace ctermbg=darkRed guibg=darkRed
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" Hide linenumbers in terminal
autocmd TermOpen * setlocal nonumber norelativenumber

set splitbelow
" }}}
" Autoread Files {{{
" Set to auto read when a file is changed from the outside
" Does not seem to work in vim
if has("nvim")
  set autoread
  au FocusGained,BufEnter * checktime
endif
" }}}
" keybindings {{{

" With a map leader it's possible to do extra key combinations
let mapleader = ","

nnoremap <leader>vr :FloatermNew nvim $MYVIMRC<CR>
nnoremap <leader>sh :FloatermNew nvim ~/.zshrc<CR>
nnoremap <leader>rl :source $MYVIMRC<CR>

nnoremap <C-n> :NERDTreeToggle<CR>
" tabs
nnoremap t1 1gt<CR>
nnoremap t2 2gt<CR>
nnoremap t3 3gt<CR>
nnoremap t4 4gt<CR>
nnoremap t5 5gt<CR>
nnoremap t6 6gt<CR>
nnoremap t7 7gt<CR>
nnoremap t8 8gt<CR>
nnoremap t9 9gt<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap ts :tab split<CR>

nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fg :GFiles?<CR>
nnoremap <leader>ag :Ag<CR>
nnoremap <leader>tt :FloatermToggle<CR>
nnoremap <leader>nt :terminal<CR>
nnoremap <leader>fm :FloatermNew vifm<CR>

function! LazyGit()
  :tabnew
  :terminal lazygit
  :startinsert
endfunction

nnoremap <leader>lg :call LazyGit()<CR>

function! DB()
  :tabnew
  :DBUI
endfunction
nnoremap <leader>db :call DB()<CR>

" Floaterm bindings {{{
function s:floatermSettings()
  tnoremap <silent> <buffer> <leader>n <C-\><C-n>:FloatermNew!<CR>
  tnoremap <silent> <buffer> <leader>k <C-\><C-n>:FloatermKill<CR>
  tnoremap <silent> <buffer> <leader>t <C-\><C-n>:FloatermToggle<CR>
  tnoremap <silent> <buffer> <leader>] <C-\><C-n>:FloatermNext<CR>
  tnoremap <silent> <buffer> <leader>[ <C-\><C-n>:FloatermPrev<CR>
endfunction
autocmd FileType floaterm call s:floatermSettings()
" }}}
" Coc keybindings {{{

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" }}}}}}

