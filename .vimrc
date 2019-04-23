set encoding=utf-8

set fileencoding=utf-8 " 保存時の文字コード
set fileformat=unix
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される

set fileencodings=utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
set clipboard=unnamed,autoselect

set nobackup
set noundofile

set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=2 " 画面上でタブ文字が占める幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2 " smartindentで増減する幅

set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルラインをハイライト

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" バックスペースキーの有効化
set backspace=indent,eol,start

set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

set runtimepath+=~/vimfiles/bundles/dein.vim
if dein#load_state(expand('~/vimfiles/dein'))
  call dein#begin(expand('~/vimfiles/dein'))
  call dein#add('w0rp/ale')
  call dein#add('maximbaz/lightline-ale')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
 " call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('othree/yajs.vim')
  call dein#add('othree/html5.vim')
  call dein#add('othree/javascript-libraries-syntax.vim')
  call dein#add('othree/es.next.syntax.vim')
  call dein#add('maxmellon/vim-jsx-pretty')
  call dein#add('ujihisa/unite-colorscheme')
  call dein#add('nanotech/jellybeans.vim')
  call dein#add('cocopon/iceberg.vim')
  call dein#add('cohama/lexima.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('mgee/lightline-bufferline')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('honza/vim-snippets')
  call dein#add('fatih/vim-go')
  if has('nvim')
    call dein#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
  else
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('tpope/vim-fugitive')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('elmcast/elm-vim')
  call dein#add('leafgarland/typescript-vim')
  call dein#end()
  call dein#save_state()
endif

" Elm
let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_syntastic_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1

nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeChDirMode = 2
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

if (!has('gui_running'))
  "set t_Co=256
  "set term=xterm-256color
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
endif

if has('gui_running')
  set guioptions-=e
endif

syntax on

if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>

nnoremap <A-;> A;<ESC>
inoremap <A-;> <ESC>A;<ESC>

if has("win32") || has("win64")
  set pythonthreedll=C:/Users/noriyuki/AppData/Local/Programs/Python/Python37/python37.dll
  let g:python3_host_prog = 'C:/Users/noriyuki/AppData/Local/Programs/Python/Python37/python'
  set rop=type:directx,renmode:5
else
  let g:python3_host_prog = expand('/usr/bin/python')
endif
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

" スニペット
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=3 concealcursor=niv
endif
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = '~/vimfiles/dein/repos/github.com/honza/vim-snippets/snippets'
"let g:neosnippet#snippets_directory='~/vimfiles/plugged/neosnippet-snippets/snippets/'

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline = {
      \ 'colorscheme' : 'iceberg',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
      \   'right': [
      \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \              [ 'lineinfo', 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ]
      \            ]
      \ },
      \ 'component_function' : {
      \   'fugitive' : 'LightLineFugitive',
      \   'filetype' : 'LightLineFiletype',
      \   'fileformat' : 'LightLineFileformat'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
      \ 'tabline' : {'left': [['buffers']], 'right': [['close']]},
      \ 'component_expand' : {
      \   'buffers': 'lightline#bufferline#buffers',
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok'
      \ },
      \ 'component_type' : {
      \   'buffers': 'tabsel',
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left'
      \ }
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

set laststatus=2
set showtabline=2
set noshowmode

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

" let g:ale_go_gometalinter_options = '--vendored-linters --disable-all --enable=gotype --enable=vet --enable=golint -t'
" let g:ale_go_gometalinter_options = '--fast --enable=staticcheck --enable=gosimple --enable=unused'

"Denite
nnoremap [denite] <Nop>
nmap <C-u> [denite]

"現在開いているファイルのディレクトリ下のファイル一覧。
nnoremap <silent> [denite]f :<C-u>DeniteBufferDir file file:new<CR>
"バッファ一覧
nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>
"レジスタ一覧
nnoremap <silent> [denite]r :<C-u>Denite register<CR>
"最近使用したファイル一覧
nnoremap <silent> [denite]m :<C-u>Denite file_mru<CR>

".git以下のディレクトリ検索
nnoremap <silent> [denite]k :<C-u>Denite -direction=topleft -cursor-wrap=true
      \ -path=`substitute(finddir('.git', './;'), '.git', '', 'g')`
      \ file_rec/git<CR>

call denite#custom#source('file'    , 'matchers', ['matcher_cpsm', 'matcher_fuzzy'])

call denite#custom#source('buffer'  , 'matchers', ['matcher_regexp'])
call denite#custom#source('file_mru', 'matchers', ['matcher_regexp'])

call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
  \ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#map('insert', '<C-N>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-P>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-W>', '<denite:move_up_path>', 'noremap')
