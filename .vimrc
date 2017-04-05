
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
filetype off
 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"使用Vundle来管理Vundle
Plugin 'gmarik/Vundle.vim'
"plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"状态栏美化
Plugin 'Lokaltog/vim-powerline'
Plugin 'git@github.com:Valloric/YouCompleteMe.git'
Plugin 'git@github.com:majutsushi/tagbar.git'
"plugin from http://vim-script.org/vim/script.html
Plugin 'L9'
Plugin 'plasticboy/vim-markdown'
"NERDtree config
Plugin 'git@github.com:scrooloose/nerdtree.git'
 
Plugin 'git@github.com:fatih/vim-go.git'
 
"神级写HTML CSS 插件
Plugin 'mattn/emmet-vim'
Plugin 'AutoClose'
Plugin 'wincent/command-t'
Plugin 'msanders/snipmate.vim'
"保存最近打开的文件"
""Plugin 'mru'
call vundle#end()
 
"允许插件  
filetype plugin indent on
 
"global config
 
"编码
""set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
""set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,chinese,cp936,gb18030,utf-16le,utf-16,big5,euc-jp,euc-kr,latin-1
""set fileencoding=utf-8
 
set t_Co=256
"Enable sytax higglighting
syntax on
"Select a colorscheme
colorscheme molokai
set guifont=Monaco:h12
set guifontwide=Monaco:h12
""set guifontwide=Hei_Regular:h14
let g:molokai_original = 1
"可以使用退格删除文字
set backspace=indent,eol,start
"显示光标所在位置
set ruler
set rulerformat=%57(%50t[%{&ff},%Y]\ %m\ %l,%c\ %p%%%)
"显示未输入完的命令
set showcmd
 
" 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set ignorecase
set smartcase
 
set incsearch        " 实时搜索
set hlsearch        " 搜索时高亮显示被找到的文本
 
"允许撤销次数
set undolevels=1000
"缩进为4
set shiftwidth=4
set softtabstop=4
"Tab键的宽度
set tabstop=4
set wrap  
set wildmenu
set matchpairs=(:),{:},[:],<:>
set whichwrap=b,s,<,>,[,]
"显示行号
set nu
"光标移动到buffer的顶部和底部时候保持3行距离
set scrolloff=3
"允许折叠
set foldenable
"手动折叠
set foldmethod=manual
 
"键盘命令
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
 
" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
"map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
"去空行  
"nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
"nnoremap <C-F2> :vert diffsplit 
"新建标签  
"map <M-F2> :tabnew<CR>  
"列出当前目录文件  
"map <F3> :tabnew .<CR>  
"打开树状文件目录  
"map <C-F3> \be
 
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
"autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
set completeopt=preview,menu 
 
"共享剪贴板  
set clipboard+=unnamed 
 
 
" 总是显示状态行
set laststatus=2
 
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
"字符间插入的像素行数目
set linespace=2
 
" 高亮显示匹配的括号
set showmatch
set helplang=cn        "设置中文帮助
set encoding=utf-8    "打开uft-8文件不乱码
set history=500        "保留历史记录
set magic            "用于正则表达式
set mouse=a            "设定在任何模式下鼠标都可用
" 插入模式输入中文完毕回到普通模式时禁用输入法
"se imd
"au InsertEnter * se noimd
"au InsertLeave * se imd
"au FocusGained * se imd
 
"关于高亮
:let hs_highlight_delimiters=1            " 高亮定界符
:let hs_highlight_boolean=1               " 把True和False识别为关键字
:let hs_highlight_types=1                 " 把基本类型的名字识别为关键字
:let hs_highlight_more_types=1            " 把更多常用类型识别为关键字
:let hs_highlight_debug=1                 " 高亮调试函数的名字
:let hs_allow_hash_operator=1             " 阻止把#高亮为错误
 
"自动补全括号
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {}<ESC>i
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>
 
" 区分终端和GUI界面"{{{
if has('gui_running')
    set guioptions-=T " 隐藏工具栏
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=L " 隐藏左侧滚动条
    set showtabline=2 " 显示Tab栏
    set guioptions+=r    "显示gui右边滚动条
    
    "字体
    ""set guifont=Menlo:h12
    ""set lines=200 columns=120
 
    if has("gui_macvim")
        set imdisable    "Set input method off
        lcd ~/Developer/    "如果为空文件，则自动设置为指定目录
        set autochdir    "自动切换到文件当前目录
 
        " 清理菜单
        " aunmenu Window
        " aunmenu Tools
    endif
else
    set ambiwidth=single
    syntax enable
endif
"}}}
 
"" Recommended key-mappings. For no inserting <CR> key.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
      return pumvisible() ? "\<C-n>\<C-y>" : "\<CR>"
endfunction
 
 
let mapleader = ","
 
"NERDTree
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeToggle<CR> 
"vim-go
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "neosnippet"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
 
"YouCompleteMe
nnoremap <buffer> <silent> gd :YcmCompleter GoTo<cr>
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_server_log_level = 'error'
 
" Tagbar
nmap <leader>tb :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
 
"powerline
let g:Powerline_symbols = 'fancy' 
 
"emmet-vim 
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
 
"mru-vim
"let MRU_File = $HOME.'/.vim/file/_vim_mru_files'
"let MRU_Max_Entries = 30    "记忆最近打开的文件数量
"let MRU_Auto_Close = 1        "窗口打开与关闭(0/1)
"nmap <leader>f :MRU<CR>
 
"其它快捷键设置
nmap <leader>s :,s///c
nmap <leader>ct :CommandT<CR>
"go mappings
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)
