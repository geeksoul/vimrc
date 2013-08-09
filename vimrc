"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 配置多語言環境
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("multi_byte")
    set encoding=utf-8
    set termencoding=utf-8
    set fileencoding=utf-8
    set formatoptions+=mM
    set fencs=utf-8,big5,gbk,sjis,euc-jp,euc-kr,utf-bom,iso8859-1,utf-16le 
    set helplang=tw
 
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
 
endif




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim 功能
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 " 關閉 Vi 相容模式 (NeoBundle需要)
   set nocompatible

 " 更動vimrc後自動載入
   if has("autocmd")
        autocmd bufwritepost ~/.vim/vimrc source ~/.vim/vimrc
   endif

 " 自動重新加載文件
   set autoread

 " 自動對齊
   set cindent

 " 保留 100 個使用過的指令
   set history=100

 " 讓 backspace 在 INSERT 模式下重獲自由 (indent 縮進處、eol 斷行處、start 開始進入 insert 模式之前的位置)
   set backspace=indent,eol,start
   
 " 文件關閉後，仍保留編輯歷史。
   set undofile
   set undodir=~/.vim/.undo
   set undolevels=1000

 " 共享系統(MAC OS X)的剪貼簿
   set clipboard=unnamed

 " 加強式尋找功能，在鍵入 patern 時會立即反應移動至目前鍵入之 patern 上
   set incsearch

 " 顯示相對應括號
   set showmatch

 " 自動摺疊語法
 " set foldmethod=indent

 " 設定縮排長度
   set softtabstop=4
   set shiftwidth=4

 " 命令行自動補全
   set wildmenu

 " 設置工作目錄為當前編輯文件的目錄
   set bsdir=buffer
   set autochdir


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 設鍵盤重設 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   
 " 自宮方向鍵
   map <up>    <nop>
   map <down>  <nop>
   map <left>  <nop>
   map <right> <nop>

 " 使用 ctrl+hjkl 在分割視窗中移動 用 +/- 調整大小
   nmap <C-j> <C-w>j
   nmap <C-k> <C-w>k
   nmap <C-h> <C-w>h
   nmap <C-l> <C-w>l
   nmap +     <C-w>+
   nmap -     <C-w>-




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NeoBundle 設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 " 關閉 Vi 相容模式 (於功能區已設定)
 " set nocompatible

 " NeoBundle 系統設定
   if has('vim_starting')
     set runtimepath+=~/.vim/bundle/neobundle.vim/
   endif

   call neobundle#rc(expand('~/.vim/bundle/'))


 " 讓 NeoBundle 管理 NeoBundle
   NeoBundleFetch 'Shougo/neobundle.vim'

 " NeoBundle 建議安裝外掛 
 " After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
   NeoBundle 'Shougo/vimproc'
 " NeoBundle 'Shougo/unite.vim'

 " 安裝 nerdtree 檔案檢視外掛
   NeoBundle 'scrooloose/nerdtree'

 " snipmate
   NeoBundle 'msanders/snipmate.vim'

 " NeoBundle 'terryma/vim-multiple-cursors'
 
 " 漂漂 PowerLine 
   NeoBundle 'Lokaltog/vim-powerline'
   let g:Powerline_symbols = 'fancy'

 " Theme
   NeoBundle 'tomasr/molokai'
   NeoBundle 'altercation/vim-colors-solarized'

 " 自動偵測外掛文件類型
   filetype plugin indent on 

   NeoBundleCheck




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim 外觀
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 " 設定預設長寬
 " set lines=35
 " set columns=140

 " 顯示標題
   set title

 " 顯示遊標線
   set cursorline

 " 在狀態列顯示目前所執行的命令
   set showcmd

 " 畫面上下方所保留的行數
   set so=7

 " 顯示所在行數 
   set ruler

 " 顯示行號
   set number

 " 打開語法效果
   syntax on

 " 尋找時，符合字串會反白表示
   set hlsearch

 " 命令行的高度 (預設值為1)
 " set cmdheight=2

 " 狀態列高度 
   set laststatus=2 

 " 區格 tab 鍵與斷行處
   set listchars=tab:>-,eol:$ 

 " 顯示 tab 與 space 的差別
 " set list

 " 支援256色
   set t_Co=256

 " 設定字型
   set guifont=YaHei_Consolas_Hybrid:h16

 " 設定Theme
   colorscheme molokai
 " colorscheme solarized   
 " set background=dark "(暗色系的 solarized)

 " 透明背景
   if has("gui_running")
       set transparency=5
   endif

 " 隱藏工具列
   set guioptions-=T




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim 程式相關
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 " <F5> 編譯和運行 C++/C 並刪除編譯檔
  autocmd FileType c,cpp nmap <F9> :w<CR> :make<CR>
  autocmd FileType c nmap <F5> :w<CR> :!gcc -Wall -o %:r % <BAR> more<CR> :!./%:r && rm ./%:r<CR>
  autocmd FileType cpp nmap <F5> :w<CR> :!g++ -Wall -o %:r % <BAR> more<CR> :!./%:r && rm ./%:r<CR>

 " 編譯 Python
 " autocmd FileType python nmap <F5> :w<CR> :!python %<CR>


 " <F10> gdb調試
   map <F10> :call Debug()<CR>
   func!  Debug()
   exec "w"
   exec "!gcc % -o %< -gstabs+"
   exec "!gdb %<"
   endfunc


 " 替 LaTex 檔作拼字檢查  
   autocmd FileType tex set spell





