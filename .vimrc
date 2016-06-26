:set encoding=utf-8 
:set fileencoding=utf-8

" 禁止光标闪烁
set gcr=a:block-blinkon0

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

filetype off
" vundle 环境设置 
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间 
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized' 
Plugin 'Lokaltog/vim-powerline'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'marijnh/tern_for_vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'alvan/vim-closetag'

call vundle#end()

filetype plugin indent on
let g:UltiSnipsSnippetDirectories=["mysnippets"]
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

nmap <F8> :TagbarToggle<CR>

"  YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
"set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全         
let g:ycm_seed_identifiers_with_syntax=1

" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %

set statusline+=%#warningmsg# 
set statusline+=%{SyntasticStatuslineFlag()} 
set statusline+=%*  
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1 
let g:syntastic_check_on_open = 1 
let g:syntastic_check_on_wq = 0

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu

"NERDTree快捷键
nmap <F3> :NERDTree  <CR>
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
" NERDTree.vim
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=32
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 0 
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
" 显示隐藏文件 
let NERDTreeShowHidden=0 
" NERDTree 子窗口中不显示冗余帮助信息
"let NERDTreeMinimalUI=1 
" 删除文件时自动删除文件对应buffer
let NERDTreeAutoDeleteBuffer=1
let NERDChristmasTree=1
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$','\.git']
let NERDTreeShowBookmarks=0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif
"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" 配色方案 
:set background=dark
colorscheme solarized
" 设置状态栏主题风格 
let g:Powerline_colorscheme='solarized'
set guifont=Consolas:h13:cANSI "Ubuntu\ Mono\ derivative\ Powerlin:h14:cANSI 
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
set t_Co=256
set guitablabel=%M\ %t
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止折行 
"set nowrap
" 总是显示状态栏 
set laststatus=2 " 
"显示光标当前位置 
set ruler 
" 开启行号显示
set number
" 高亮显示当前行/列 
set cursorline 
"set cursorcolumn 
" 高亮显示搜索结果 
set hlsearch
" 开启语法高亮功能 
syntax enable 
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" 自适应不同语言的智能缩进 
filetype indent on 
" 将制表符扩展为空格 
set expandtab 
" 设置编辑时制表符占用空格数 
set tabstop=4
" 设置格式化时制表符占用空格数 
set shiftwidth=4
" 让 vim
" 把连续数量的空格视为一个制表符 
set softtabstop=4
" 基于缩进或语法进行代码折叠 
set foldmethod=indent
set foldmethod=syntax "
" 启动 vim 时关闭折叠代码 
set nofoldenable

