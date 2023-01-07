set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=2          "タブを何文字の空白に変換するか 
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
set termguicolors      "TrueColor対応
set background=dark    "backgroundカラー設定
set helplang=ja

" terminal ノーマルモード移行<Esc>キーで出来る様にする
tnoremap <Esc> <C-\><C-n>

call plug#begin('$HOME/.local/share/nvim/plugged')
"Plug 'neovim/nvim-lspconfig'
"Plug 'rakr/vim-one'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'airblade/vim-gitgutter'
"Plug 'rust-lang/rust.vim'
"Plug 'ryanoasis/vim-devicons'
"Plug 'vim-denops/denops.vim'

"Plug 'Shougo/ddc.vim'
"Plug 'Shougo/ddc-around'
"Plug 'Shougo/ddc-matcher_head'
"Plug 'Shougo/ddc-matcher_length'
"Plug 'Shougo/ddc-sorter_rank'
"Plug 'Shougo/ddc-nvim-lsp'
"Plug 'Shougo/pum.vim'
"Plug 'Shougo/neco-vim'
"Plug 'Shougo/ddc-cmdline-history'
"Plug 'tani/ddc-fuzzy'
"Plug 'lambdalisue/fern.vim'

"Plug 'matsui54/denops-popup-preview.vim'
"Plug 'ray-x/lsp_signature.nvim'

call plug#end()

""========================================="
"" ddc.vim plugin setting 
""========================================="
"" lspを表示だけするならaroundは必須ではないけど基礎的なsourceなので記載
"call ddc#custom#patch_global('sources', ['nvim-lsp', 'around'])
"call ddc#custom#patch_global('sourceOptions', #{
"  \   _: #{
"  \     ignoreCase: v:true,
"  \     matchers: ['matcher_head'],
"  \     sorters: ['sorter_rank'],
"  \   },
"  \   around: #{
"  \     mark: 'A',
"  \     matchers: ['matcher_head', 'matcher_length'],
"  \   },
"  \   nvim-lsp: #{
"  \     mark: 'lsp',
"  \     forceCompletionPattern: '\.\w*|:\w*|->\w*',
"  \   },
"  \ })
"
"" ちょっとここの設定の意味はよくわからない
"call ddc#custom#patch_global('sourceParams', #{
"  \ nvim-lsp: #{ maxSize: 500, kindLabels: #{ Class: 'c' } },
"  \ })
"
"" 明示的に起動が必要（忘れがち）
"call ddc#enable()
"call popup_preview#enable()
"
"" <TAB>/<S-TAB> completion.
"inoremap <silent><expr> <TAB>
"  \ pumvisible() ? '<C-n>' :
"  \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
"  \ '<TAB>' : ddc#map#manual_complete()
"inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'
"
"lua require("lsp_signature").setup()
""========================================="
"" ddc-fuzzy plugin setting 
""========================================="
"call ddc#custom#patch_global('completionMenu', 'pum.vim')
"call ddc#custom#patch_global('sourceOptions', #{
"  \   _: #{
"  \     ignoreCase: v:true,
"  \     matchers: ['matcher_fuzzy'],
"  \     sorters: ['sorter_fuzzy'],
"  \     converters: ['converter_fuzzy']
"  \   },
"  \   around: #{ mark: 'A' },
"  \   nvim-lsp: #{
"  \     mark: 'lsp',
"  \     forceCompletionPattern: '\.\w*|:\w*|->\w*',
"  \   },
"  \ })
"
"" <TAB>/<S-TAB> completion. ここはddcのtab補完設定なのでpum.vimを使うなら不要
"" inoremap <silent><expr> <TAB>
""   \ pumvisible() ? '<C-n>' :
""   \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
""   \ '<TAB>' : ddc#map#manual_complete()
"" inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'
"
"inoremap <Tab>   <Cmd>call pum#map#insert_relative(+1)<CR>
"inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
"inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
"inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
"inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
"inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>
"inoremap <PageDown> <Cmd>call pum#map#insert_relative_page(+1)<CR>
"inoremap <PageUp>   <Cmd>call pum#map#insert_relative_page(-1)<CR>
"
""========================================="
"" cmdline plugin setting
"" Plug 'Shougo/neco-vim'
"" Plug 'Shougo/ddc-cmdline-history'の設定
""========================================="
"cnoremap <expr> <TAB>   pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' : ddc#map#manual_complete()
"cnoremap <expr> <S-TAB> pum#visible() ? '<Cmd>call pum#map#insert_relative(-1)<CR>' : ddc#map#manual_complete()
"cnoremap <expr> <C-n>   pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' : '<C-n>'
"cnoremap <expr> <C-p>   pum#visible() ? '<Cmd>call pum#map#insert_relative(-1)<CR>' : '<C-p>'
"cnoremap <expr> <CR>    pum#visible() ? '<Cmd>call pum#map#confirm()<CR>' : '<CR>'
"" cnoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
"" cnoremap <C-e>   <Cmd>call pum#map#cancel()<CR>
"nnoremap :       <Cmd>call CommandlinePre()<CR>:
"
"function! CommandlinePre() abort
"  " Overwrite sources
"  let s:prev_buffer_config = ddc#custom#get_buffer()
"  call ddc#custom#patch_buffer('sources', ['necovim', 'cmdline-history'])
"  call ddc#custom#patch_buffer('autoCompleteEvents', ['CmdlineChanged'])
"  call ddc#custom#patch_buffer('sourceOptions', #{
"    \   _:  #{
"    \    ignoreCase: v:true,
"    \    matchers:   ['matcher_fuzzy'],
"    \    sorters:    ['sorter_fuzzy'],
"    \    converters: ['converter_fuzzy']
"    \   },
"    \   necovim: #{ mark: 'neco' },
"    \   cmdline-history: #{ mark: 'hist' },
"    \ })
"
"  autocmd CmdlineLeave ++once call CommandlinePost()
"
"  " Enable command line completion
"  call ddc#enable_cmdline_completion()
"endfunction
"function! CommandlinePost() abort
"  " Restore sources
"  call ddc#custom#set_buffer(s:prev_buffer_config)
"endfunction
"========================================="
" plugin Manager: vim-plug setting
"========================================="

" vim-plug なかったら落としてくる
if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 足りないプラグインがあれば :PlugInstall を実行
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

"========================================="
" plugin Fern Setting
"========================================="

" Show hidden files
let g:fern#default_hidden=1
" Show icon
let g:fern#renderer = 'nerdfont'

" Show file tree with Ctrl + n
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=30<CR>

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
"========================================="
" plugin Manager: dein.vim setting
" deinが上手く動作しない場合、:call dein#update()と
" :call dein#recache_runtimepath()を実行する
"========================================="
if &compatible
  set nocompatible
endif

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
"dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
"dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイルを用意しておく
  let g:rc_dir    = expand('~/.config/nvim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

   " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

  "もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

let g:dein#install_max_processes = 16

"========================================="
" setting
"========================================="
filetype plugin indent on

syntax enable
colorscheme gruvbox-material
let g:airline_theme = 'wombat'
" powerline enable(最初に設定しないとダメ)
let g:airline_powerline_fonts = 1
" タブラインを表示
let g:airline#extensions#tabline#enabled = 1
" 選択行列の表示をカスタム(デフォルトだと長くて横幅を圧迫するので最小限に)
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
" gitのHEADから変更した行の+-を非表示(vim-gitgutterの拡張)
let g:airline#extensions#hunks#enabled = 0

"========================================="
"NeoVim専用コマンド
"Denoを自動実行する
"kawarimidollの自作コマンド
"kawarimidollの作成したコマンドdeno-dexに移行する予定
"========================================="
command! DenoRun silent only | botright 12 split |
   \ execute 'terminal deno ' .
   \ (expand('%:t') =~ '^\(.*[._]\)\?test\.\(ts\|tsx\|js\|mjs\|jsx\)$'
   \    ? 'test' : 'run')
   \ . ' -A --no-check --unstable --watch ' . expand('%:p') |
   \ stopinsert | execute 'normal! G' | set bufhidden=wipe |
   \ execute 'autocmd BufEnter <buffer> if winnr("$") == 1 | quit! | endif' |
   \ wincmd k

"========================================="
"Auto Commands
"========================================="
augroup vimrc
  " [NeovimのTerminalモードをちょっと使いやすくする](https://zenn.dev/ryo_kawamata/articles/improve-neovmi-terminal)
  autocmd TermOpen * startinsert

augroup END
