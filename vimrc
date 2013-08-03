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
 
"    if has("win32")
"	"處理MENU及右鍵MENU亂碼
"        source $VIMRUNTIME/delmenu.vim
"        source $VIMRUNTIME/menu.vim
"        source $VIMRUNTIME/mswin.vim
"        behave mswin
"        language messages zh_TW.utf-8 "處理consle輸出亂碼
"    endif
"else
"    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim 功能
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 " 關閉 Vi 相容模式 (NeoBundle需要)
   set nocompatible

 " 更動vimrc後自動載入
   if has("autocmd")
       if has("~/.vimrc")
	   autocmd bufwritepost ~/.vimrc source ~/.vimrc
       else 	
	   autocmd bufwritepost ~/.vim/vimrc source ~/.vim/vimrc     
       endif
   endif

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

 " displays tabs with :set list & displays when a line runs off-screen
 "set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
 "set listchars=tab:>-,eol:↵,trail:-,precedes:<,extends:>

 " 顯示 tab 與 space 的差別
 " set list

 " 設定字型
   set guifont=YaHei_Consolas_Hybrid:h16

 " 設定Theme
   colorscheme molokai
 " colorscheme solarized   
 " set background=dark "(暗色系的 solarized)

 " 支援256色
   set t_Co=256

 " 透明背景
   if has("gui_running")
       set transparency=5
   endif

 " 隱藏工具列
   set guioptions-=T




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim 程式相關
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" <F4> 編譯和運行C++
" nnoremap <F4> :<C-U>make %:r && ./%:r<CR>

 " <F5> 編譯和運行C++
   map <F5> :call CompileRunGpp()<CR>
   func! CompileRunGpp()
   exec "w"
   exec "!g++ % -o %<" 
   exec "! ./%<"  
   exec "!rm %<"
   endfunc


 " <F6> 編譯和運行C
   map <F6> :call CompileRunGcc()<CR>
   func! CompileRunGcc()
   exec "w"
   exec "!gcc % -o %<"
   exec "! ./%<"
   endfunc


 " <F7> 運行python程序
   map <F7> :w<cr>:!python %<cr>


 " <F10> gdb調試
   map <F10> :call Debug()<CR>
   func!  Debug()
   exec "w"
   exec "!gcc % -o %< -gstabs+"
   exec "!gdb %<"
   endfunc



