set nocompatible              " be iMproved, required
filetype off                  " required

"vundle的工作目录"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"vundle工作必须代码"
Plugin 'VundleVim/Vundle.vim'

"github上的代码直接填写作者名/项目名就可以了"
Plugin 'tpope/vim-fugitive'
" 项目没有托管在github上则需要给出完整路径
"Plugin 'git://git.wincent.com/command-t.git'
" 本地插件需要写完成路径
"Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'altercation/solarized' "配色方案"
Plugin 'taglist.vim'  "代码跳转"
"Plugin 'Valloric/YouCompleteMe'"自动补全"" 
Plugin 'scrooloose/nerdtree' "菜单树"
Plugin 'vim-airline/vim-airline'  "状态栏增强"
" 所有的插件都必须写在这行代码的上面
call vundle#end()            " required
filetype plugin indent on    " required
"filetype plugin on
"
" 帮助命令
" Brief help
" :PluginList       - 列出可用的插件 
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" :h 显示详情


"""""""""""""
"基础配置
"""""""""""""
set number "显示行号
set expandtab "tab转换成空格
set tabstop=4 "tab的长度为４
set shiftwidth=4
"set cul  "高亮当前行
set hlsearch

"自动缩进"
"set autoindent
"set cindent

syntax enable "语法高亮
"    set background=dark
"    colorscheme solarized


set autowrite "自动保存"
set autoread "文件修改后自动读入"

"可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"set mouse=a "n普通模式　v可视模式　i插入模式 c命令模式　h帮助模式　a所有模式"
"set selection=exclusive
"set selectmode=mouse,key"


filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全

" 自动补全配置
set completeopt=longest,menu
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>

"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"防止新建.h的时候加载到cpp 在vim的filetype.vim 配置文件中 有一段这样的代码 
"当你的文件是.h 后缀名的时候 回检测g:c_systax_for_h 是否存在  如果存在会把filetype设置为c  否则默认设置为cpp
let g:c_syntax_for_h=1
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处""""""""""""""'']'']"'']'']"""""""""""""""""""""""""""


" CTags的设定  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let Tlist_Sort_Type = "name"    " 按照名称排序  
"let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  
"let Tlist_Compart_Format = 1    " 压缩方式  
"let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
"let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
"let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
"autocmd FileType java set tags+=D:\tools\java\tags  
"utocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  
"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
"设置tags  
"set tags=tags  
"set autochdir 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=1    " 启动显示状态行(1),总是显示状态行(2) 
set foldenable "允许折叠
set foldmethod=manual "manual indent syntax 


set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8


autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.php,*.html,*txt exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: booming.young") 
        call append(line(".")+2, "\# mail: real_ybm@outlook.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    elseif &filetype == 'php'
        call setline(1, "<?php") 
        call append(line("."), " /**") 
        call append(line(".")+1, "    > Author: booming.young") 
        call append(line(".")+2, "    > Mail: real_ybm@outlook.com") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " **/") 
        call append(line(".")+5, "")
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: booming.young") 
        call append(line(".")+2, "    > Mail: real_ybm@outlook.com")
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"映射全选　复制"
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
vmap <C-c> y "+y选中状态下ctrl+c复制"

"打开树状目录"
map <F3> :tabnew .<CR>
map <C-n> :NERDTreeToggle<CR>

"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
