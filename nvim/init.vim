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
Plug 'mgee/lightline-bufferline'
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'w0rp/ale'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'othree/yajs.vim', { 'for': ['js', 'jsx'] }
Plug 'othree/html5.vim', { 'for': ['html', 'js', 'jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['js', 'jsx'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['js', 'jsx'] }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['js', 'jsx'] }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'rcmdnk/vim-markdown', { 'for': ['md', 'markdown'] }
call plug#end()

filetype plugin indent on
syntax enable

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

let g:lightline = {
  \'colorscheme' : 'iceberg',
  \'active': {
  \  'left': [ [ 'mode', 'paste' ],
  \            [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
  \  'right': [
  \             [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
  \             [ 'lineinfo', 'percent' ],
  \             [ 'fileformat', 'fileencoding', 'filetype' ]
  \           ]
  \},
  \'component_function' : {
  \  'fugitive' : 'LightLineFugitive',
  \  'filetype' : 'LightLineFiletype',
  \  'fileformat' : 'LightLineFileformat'
  \},
  \'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
  \'tabline' : {'left': [['buffers']], 'right': [['close']]},
  \'component_expand' : {
  \  'buffers': 'lightline#bufferline#buffers',
  \  'linter_checking': 'lightline#ale#checking',
  \  'linter_warnings': 'lightline#ale#warnings',
  \  'linter_errors': 'lightline#ale#errors',
  \  'linter_ok': 'lightline#ale#ok'
  \},
  \'component_type' : {
  \  'buffers': 'tabsel',
  \  'linter_checking': 'left',
  \  'linter_warnings': 'warning',
  \  'linter_errors': 'error',
  \  'linter_ok': 'left'
  \}
\}

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ''._ : ''
  endif
  return ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeChDirMode = 2
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:DevIconsEnableFoldersOpenClose = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

let g:ale_linters = {
  \ 'javascript': ['eslint']
  \ }
let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \ }
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 500

"カラースキーマ
colorscheme iceberg
