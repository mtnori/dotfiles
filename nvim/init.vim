filetype plugin indent off

set mouse=a
set fileformats=unix,dos,mac
" 端末上でTrue Colorを使用
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" 読み込み時に試みるエンコーディング(左から順に試す)
set fileencodings=ucs-bombs,utf-8,euc-jp,cp932
" 全角文字をちゃんと表示する
set ambiwidth=double
" スワップファイルを作らない
set noswapfile
" バッファを隠す(?)
set hidden
" クリップボードとNeoVimの無名レジスタを一体化
set clipboard=unnamed,unnamedplus
" 行番号
set number
" 空白文字等、不可視な文字の可視化
set list
set listchars=tab:>-,trail:*,nbsp:+
" インデントとか 見ての通り
set smartindent
set visualbell
" ヘルプの日本語化
set helplang=ja,en

" 見た目の行間移動
nnoremap j gj
nnoremap k gk

" jjでインサートモードから抜ける
inoremap <silent> jj <ESC>

" 入力モードでのカーソル移動
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>

" 行頭行末間移動(backspace, space, カーソルキー)
set whichwrap=b,s,h,l,<,>,[,],~
" カーソルラインをハイライト
set cursorline

" タブ関連
set expandtab "タブ入力を空白に変換
set tabstop=2 "タブを何文字の空白に変換するか
set shiftwidth=2 "自動インデント時に入力する空白の数

"vv で行末まで選択
vnoremap v ^$h

" 検索関連
" 大文字と小文字を区別しない
set ignorecase
" 混在しているときに限り区別
set smartcase
" 下まで行ったら上に戻る
set wrapscan
" Esc連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" Shift+Enterで上に、Shift+Ctrl+Enterで下に空行を追加(GUI用)
imap <S-CR> <End><CR>
imap <C-S-CR> <Up><End><CR>

nnoremap <S-CR> mzo<ESC>`z
nnoremap <C-S-CR> mzO<ESC>`z

" スクロール送りを開始する前後の行数を指定
set scrolloff=5

" ペースト時のインデントのズレを防ぐ(https://qiita.com/kqt0k0/items/bcfa84c5f85276315954)
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")]
endif

"pythonの設定
let g:python3_host_prog = 'C:/Users/noriyuki/AppData/Local/Programs/Python/Python37/python'

" Ctrl+W -> n で新規タブ
nnoremap <C-w>n <Esc>:enew<Return>

" WSLのクリップボードと連動
nnoremap <silent> <Space>y :.w !win32yank.exe -i<CR><CR>
vnoremap <silent> <Space>y :w !win32yank.exe -i<CR><CR>
nnoremap <silent> <Space>p :r !win32yank.exe -o<CR>
vnoremap <silent> <Space>p :r !win32yank.exe -o<CR>

" 常にタブラインを表示
set showtabline=2
" 現在のモードを表示しない(lightlineで表示するため)
set noshowmode

" set all file whose extension is '.tex' as LaTeX file
let g:tex_flavor = 'latex'

" Vim markdown(tpope) ぷらぎんでもないのでココに。
let g:markdown_fenced_languages = [
\ 'html',
\ 'python',
\ 'bash=sh',
\ 'js=javascript',
\ 'json=javascript',
\ 'c',
\ 'vim'
\]

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'cocopon/iceberg.vim'
"Plug 'mgee/lightline-bufferline'
"Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'
"Plug 'w0rp/ale'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'othree/yajs.vim', { 'for': ['js', 'jsx'] }
Plug 'othree/html5.vim', { 'for': ['html', 'js', 'jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['js', 'jsx'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['js', 'jsx'] }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['js', 'jsx'] }
Plug 'leafgarland/typescript-vim', { 'for': ['ts', 'tsx'] }
Plug 'ianks/vim-tsx', { 'for': ['ts', 'tsx'] }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'rcmdnk/vim-markdown', { 'for': ['md', 'markdown'] }
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'junegunn/fzf', has('win32') ? {} : {'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

filetype plugin indent on
syntax enable

nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeChDirMode = 2
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"カラースキーマ
colorscheme iceberg

"ctagsに読み込ませるtagsファイルを指定する
set tags=./tags;

" ここからcoc.nvimの設定
" if hidden is not set, TextEdit might fail.
set hidden

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:fzf_command_prefix = 'Fzf'
if has('win32') || has('win64')
  command! -bang -nargs=* FzfRg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case "'.<q-args>.'"', 1,
    \   <bang>0)
endif
nnoremap <silent> <C-x>r :<C-u>call <SID>SearchRipgrep()<CR>
function! s:SearchRipgrep()
  let l:word = input("Search Word? ")
  if l:word =~ "\s*"
    execute ":FzfRg " . l:word
  endif
endfunction
