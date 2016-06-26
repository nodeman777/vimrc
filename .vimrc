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
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript' 
Plugin 'mxw/vim-jsx'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'isRuslan/vim-es6'

call vundle#end()

filetype plugin indent on
let g:UltiSnipsSnippetDirectories=["mysnippets"]
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" ----------------------------------------------------------------------------
" vim-autoformat
"require: npm install -g js-beautify
" ----------------------------------------------------------------------------
autocmd FileType javascript,json,html,css,scss noremap <buffer>  <leader>f :Autoformat<cr>



" ----------------------------------------------------------------------------
" vim-jsx
" ----------------------------------------------------------------------------
let g:jsx_ext_required = 0 " Allow JSX in normal JS files"
let g:used_javascript_libs = 'react'
" ----------------------------------------------------------------------------
" tern_for_vim
" ----------------------------------------------------------------------------
let tern_show_signature_in_pum = 1
let tern_show_argument_hints = 'on_hold'
autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
autocmd FileType javascript setlocal omnifunc=tern#Complete

"nerdcommenter setting
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


"ag setting
set runtimepath^=~/.vim/bundle/ag
"configure ag.vim to always start searching from your project root instead of the cwd
let g:ag_working_path_mode="r"


" CtrlP setting 
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'

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
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<Tab>', '<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_semantic_triggers =  {
            \   'cs,java,typescript,d,python,perl6,scala,vb,elixir,go' : ['.', 're!(?=[a-zA-Z]{3,4})'],
            \   'html': ['<', '"', '</', ' '],
            \   'vim' : ['re![_a-za-z]+[_\w]*\.'],
            \   'lua' : ['.', ':'],
            \   'scss,css': [ 're!^\s{2,4}', 're!:\s+' ],
            \   'javascript': ['.', 're!(?=[a-zA-Z]{3,4})'],
            \ }
" ----------------------------------------------------------------------------
" tagbar
" require ctags, jsctags
" npm install -g git+https://github.com/ramitos/jsctags.git
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" ctrlp.vim
" ----------------------------------------------------------------------------
nnoremap <leader>m :CtrlPMRU<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](node_modules|target|dist)|\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
let g:ctrlp_follow_symlinks=1

let g:tagbar_type_javascript = {
    \ 'ctagsbin' : 'jsctags'
    \ }
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_width = 50

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


" ----------------------------------------------------------------------------
" syntastic
" ----------------------------------------------------------------------------
let g:syntastic_error_symbol='✘'
let g:syntastic_warning_symbol='❗'
let g:syntastic_style_error_symbol='»'
let g:syntastic_style_warning_symbol='•'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1 
let g:syntastic_check_on_wq = 0

set statusline+=%#warningmsg# 
set statusline+=%{SyntasticStatuslineFlag()} 
set statusline+=%*  
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
set background=dark
colorscheme solarized
" 设置状态栏主题风格 
let g:Powerline_colorscheme='solarized'
set guifont=Consolas:h13:cANSI "Ubuntu\ Mono\ derivative\ Powerlin:h14:cANSI 
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
set t_Co=256
" ----------------------------------------------------------------------------
" vim-colors-solarized
" ----------------------------------------------------------------------------
let g:solarized_termcolors=16
"let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"


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
set cursorcolumn 
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
