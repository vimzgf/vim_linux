set nocompatible
"set nocp
"set lines=35 columns=118
"在.vimrc文件中添加如下命令，配置自动保存折叠状态：

au BufWinLeave * silent mkview
au BufWinEnter * silent loadview
filetype on 
 "自动识别文件类型 补丁
filetype plugin on    



"===================
"
"      vundle
"
"===================
"这一行是关键 require! important when in windows environment.避免git命令行中'与"冲突
if has('win32')
	au FileType vundle setlocal noshellslash
endif
"======
filetype off  
" 此处规定Vundle的路径  
"set rtp+=$VIM/vimfiles/bundle/vundle/
"call vundle#rc("$VIM/vimfiles/bundle/") 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Plugin 'gmarik/vundle'  
Plugin 'gmarik/Vundle.vim'
"plugin on github 
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'vimwiki/vimwiki'
Plugin 'mattn/emmet-vim'

"Plugin 'waylan/vim-markdown-extra-preview'
"Plugin 'jnwhiteh/vim-golang'
" vim-scripts repos , http://vim-scripts.org/vim/scripts.html 
"long time not update
Plugin 'winmanager'
Plugin 'c.vim'
Plugin 'snipMate'
Plugin 'OmniCppComplete'
Plugin 'minibufexpl.vim'
Plugin 'L9'  
Plugin 'FuzzyFinder'
Plugin 'AutoComplPop'
Plugin 'libList.vim'
Plugin 'surround.vim'
Plugin 'matchit.zip'
Plugin 'YankRing.vim'  
Plugin 'Tagbar'
Plugin 'vim-latex'
Plugin 'pydiction-master'
"Plugin 'ZenCoding.vim'
"Plugin 'python_fold'
"
"
"plugin not on  github or vim-scripts
" non github reposo
" 非github的插件，可以直接使用其git地址
" Vundle 'git://git.wincent.com/command-t.git'
" ...
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"set runtimepath +=~/.vim/vimfiles
"
"
set autoindent
"
"c语言缩进方式
set cindent  


"let current_compiler = "msvc"
"设定编译器为 msvc 微软编译器
":compiler msvc

"单文件编译
"set makeprg=cl.exe
"set makeprg=nmake

"nmake\ 必须有一空格后加%:r.mak才有效 文件名为当前文件拓展名为.mak 使用nmake必须有.mak文件 该命令必须在没set makeprg=nmake时有效
"set makeprg=nmake\ %:r.mak

if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
"

set encoding=utf-8
"中文 乱码
set fileencodings=utf-8,gb2312,gbk,gb18030

set termencoding=utf-8

"把这行去掉就没有^M。 set fileformats=unix 

"set encoding=prc  


"set  guifont =Courier_New:h12:cANSI
"set  gfw=仿宋_GB2312:h12

language messages zh_CN.utf-8

"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"===============================
"gvim 菜单设置
"菜单栏和下面(图标)工具栏消失
"set guioptions=t
"菜单栏(中文)项显示
"set guioptions=m
"图标工具栏(图标 )项显示
"set guioptions=T
"===================================
"
"这样可以使alt快捷键不受windows的alt快捷键干扰
set guioptions=T,r
"设置滚动条r

"==================================
"
"       statusline   
"
"==================================
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
 
set statusline=%f\%h%1*%m%r%w%0*[%{strlen(&filetype)?&filetype:'none'},%{&encoding},%{&fileformat}]\ %b\ 0x%B\ %=%(%l,%c%V%)\ %<%p%%\ [%L]\ \ %{strftime('%H:%M\ %m-%d\ %A')}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"显示行号 set nu 不显示行号 set nonu
set nu                     


"如果设置了cscopeverbose选项,那么在Vim查找Cscope数据库并且查找失败时给出错误信息,而Vim默认的设置为
"nocscopeverbose
set nocsverb



"=============
"
"cscope keymapping  setting
"
"=============

"这两个按键映射可以通过外部shell bat命令实现
nmap tg :!ctags -R<cr>
nmap sc :!cscope -b<cr>

nmap <M-t> :call GenTags()<CR>

"tag Create  shell or cmd
func! GenTags()
  " let curdir = bufname("%")
	let cmd = "del *.file&del *.out&del tags&dir /s /b *.c *.cpp *.h>cscope.file&cscope -Rb&ctags -R --c++-kinds=+p --fields=+ialS --extra=+q"	
	exec ":!".cmd

endfunc



" ======= 引号 && 括号自动匹配 ======= "

"inoremap ( ()<ESC>i

"inoremap ) <c-r>=ClosePair(')')<CR>

inoremap { {}<ESC>i

"inoremap } <c-r>=ClosePair('}')<CR>

"inoremap [ []<ESC>i

"inoremap ] <c-r>=ClosePair(']')<CR>

"inoremap " ""<ESC>i

"inoremap ' ''<ESC>i

"inoremap ` ``<ESC>i

function ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
     return "\<Right>"
  else
     return a:char
  endif
endf

"----------【快捷键】--------------

"=============================
"
"设置保存快捷键 alt+s
"
"============================
nmap s :w!<cr>


"
"在insert下将jj映射为esc 即返回normal
imap jj <esc>
imap JJ <esc>
"在选择高亮模式下将jk映射为esc 即返回normal
vmap ii <esc>
""""""""""""""""""""""""""""""""""""

"这个是设定是否使用 quickfix 窗口来显示 cscope 结果.
set cscopequickfix=c-,d-,i-,t-,e-,s-
"通过设置’cst’，你将始终同时查找cscope数据库和tags文件

"set cscopetag
"set cst
"set csto=0


"=========================
"
"switch between windows with leader key/Ctrl key
"
"=========================
let mapleader=';'
"<leader> is  '\'
"nnoremap <leader>h <C-w>h
"nnoremap <leader>k <C-w>k
"nnoremap <leader>j <C-w>j
"nnoremap <leader>l <C-w>l
imap i <esc>zza
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
"nnoremap <M-q> <C-w>w
nnoremap w <C-w>w


""""""""""""""""""""""""""""""""""
"把下面代码放到vim的配置文件.vimrc，这段代码实现的效果是
"在普通模式 或可视模式下选择一段代码，
"同时按[Alt]+[j] 或[Alt]+[k] 可控制代码向上、向下移。

nmap j mz:m+<cr>`z
nmap k mz:m-2<cr>`z
vmap j :m'>+<cr>`<my`>mzgv`yo`z
vmap k :m'<-2<cr>`>my`<mzgv`yo`z



"===============【END】========================



"=======================
"
"       ctags 初始化
"
set tags=tags; "分号是必不可少的。       
set autochdir 


"""""
" ctags 索引文件
"要使用OmniCppComplete必须以下命令初始
set tags+=$VIM/ctags/tags/tags 
"set tags+=$VIM/ctags/tags/vc/tags  " ctags 索引文件
"set tags+=$VIM/ctags/tags/STL/tags
"set tags+=$VIM/ctags/tags/sttc/tags

"============================



" OmniCppComplete cpp补全插件
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全

" search namespaces in this and included files
let OmniCpp_NamespaceSearch = 2 
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]


" 自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest


"==========================
"
"FuzzyFinder
"
"FufCoverageFile! to add! precise pattern match
"
"==========================
"
map ,,  :FufCoverageFile!<cr>




"=========================
"
"    yankring.vim f11 display the yank content
"
"============================
:nnoremap <silent><F8> :YRShow<CR>

""""""""""""""""""""""""""""



"=================================
"
"     避免出现多个miniBufExplorer windows
"
"==================================

let g:miniBufExplorerMoreThanOne=0

let g:miniBufExplMaxHeight =3 
map <leader>c :CMiniBufExplorer<cr>  

"solved conflict between miniBufExpl and TagList tagbar....
   let g:miniBufExplModSelTarget = 1
"direct switch in minibufexplorer by use Ctrl-Tab   
  let g:miniBufExplMapCTabSwitchBufs=1
   let g:miniBufExplForceSyntaxEnable = 1
   let g:miniBufExplMapCTabSwitchWindows=0
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1


"""""""""""""""""""""""""""




"===================================
"
"  tagbar configuration
"
"===================================
"设置tarbar置于左
""""""""""""""""""""""""""""""""""
"let g:tagbar_left=1 
let g:tagbar_right=1 
let g:tagbar_autofocus = 1
let g:tagbar_expand = 1
 let g:tagbar_systemenc = 'cp936'
let g:tagbar_compact = 1
nmap 8 :TagbarToggle<CR> 


""""""""""""""""""""""""""""""""""
"tagbar configuration of JavaScript
"""""""""""""""""""""""""""""""""""
let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'JavaScript',
    \ 'kinds'     : [
        \ 'o:objects',
        \ 'f:functions',
        \ 'a:arrays',
        \ 's:strings'
    \ ]
\ }


"
"""""""""""""""""""""""""""""""





"============================
"
"    winManager setting
"
"============================


"全局变量g:
"let g:winManagerWindowLayout='TagList'
"在normal模式下wm映射WMToggle
"nmap wm :WMToggle<cr>      
"nnoremap <silent> <F12> :A<CR>
"设置winmanager的宽度，默认为25
 "let g:winManagerWidth = 30

"""""""""""""""""""""""""""""""""""""""""
"nmap <C-t> :colder<CR>:cc<CR>
" 不同时显示多个文件的 tag ，只显示当前文件的
let Tlist_Show_One_File=1
" 如果 taglist 窗口是最后一个窗口，则退出 vim
let Tlist_Exit_OnlyWindow=1

let Tlist_File_Fold_Auto_Close=1     "非当前文件，函数列表折叠隐藏  

"把taglist窗口放在屏幕的右侧，缺省在左侧	 
"	let Tlist_Use_Right_Window=1 
"
"
"""""""""""""""""""""""""""""""""""""""""
"taglist_ support  ctags langdef option language
let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function'	
"""""""""""""""""""""""""""""""""""""''




"==================
"
"ZenCode setting
"
"==================
"zencode setting
 let g:user_zen_settings = {
  \  'indentation' : '  ',
  \  'perl' : {
  \    'aliases' : {
  \      'req' : 'require '
  \    },
  \    'snippets' : {
  \      'use' : "use strict\nuse warnings\n\n",
  \      'warn' : "warn \"|\";",
  \    }
  \  }
  \}

  let g:user_zen_expandabbr_key = '<c-e>'

  let g:use_zen_complete_tag = 1
  let g:user_zen_next_key='n'
  let g:user_zen_prev_key='m'
""""""""""""""""""""""""""""""""""""""""

"========================
"
"       NerdTree      
"
"========================
    map 3 :NERDTreeToggle<CR>
"   map <m-3> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
"   map <leader>e :NERDTreeFind<CR>
    nmap <leader>f :NERDTreeFind<CR>
    let g:NERDTreeWinPos = 'left' 
    let NERDTreeShowBookmarks=1
    "
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
    let NERDTreeChDirMode=2 "setting root dir in NT also sets VIM's cd
    let NERDTreeQuitOnOpen=1 "the Nerdtree window will be close after a file is opend.
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    " 排序
let NERDTreeSortOrder=['\/$','\.cpp$','\.c$', '\.h$','\.rc','*']  
"let NERDTreeDirArrows=1
"设置NERDTree子窗口宽度

let NERDTreeWinSize=20
let NERDChristmasTree =1 


"切换工作区workplace位当前编辑文件所在目录
"refresh directory in NERDTree
"
"nnoremap <leader>n :NERDTree .<CR>
"""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""






"===================================
"
"Jsbeautify.vim插件格式化压缩的js代码
"
"===================================
"F4快捷格式化js代码
"nnoremap <F4> :call g:Jsbeautify()<CR>
"let mapleader=","

""""""""""""""""""""""""""""""""""


"=================================
"
"   vim-latex config  
"
"=================================
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


"''''''''''''''
let $VIM="~/.vim"

"启动snipMate.vim模板补全功能 因为vim不能自动加载
"source $HOME/.vim/after/plugin/snipMate.vim
source $VIM/bundle/snipMate/after/plugin/snipMate.vim

let g:snippets_dir="~/.vim/bundle/snipMate/snippets/"
let g:acp_behaviorSnipmateLength=-1

colorscheme mywombat256
"colorscheme molokai
"配色方案对应脚本colors\wombat256.vim


"
"let g:acp_behaviorSnipmateLength为-1关闭omni补全的snipmate关键词支持，同时对大写无冲突
"为n时开启omni补全的snipmate关键词支持要求光标前n个字符，同时对大写无冲突

"==================================
"
"    M-b  return to edit buffer
"
"==================================

nnoremap b :call JumpBufferex()<CR>

"=================================
"
" 自定义函数  让光标直接跳至minibufexpl下的窗口
" :nr wincmd w 等同于跳转至第nr好窗口
"
"=================================
func! JumpBufferex()
  " let curdir = bufname("%")
   "if (curdir == '*.*')
	let num1 =1 + bufwinnr("-MiniBufExplorer-")
	

	echo num1
	exec ":".num1." wincmd w" 

   "else   
   "endif
endfunc


"=============================
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
"================================
func! Author()
"如果文件类型为.sh文件
	if &filetype == 'sh'
	call append(0,"\#########################################################################")
	call append(1, "\# File Name: ".expand("%"))
	call append(2, "\# Author: Skyrim")
	call append(3, "\# mail: xxxx@gmail.com")
	call append(4, "\# Created Time: ".strftime("%c"))
	call append(5, "\#########################################################################")
	call append(6, "\#!/bin/bash")
	call append(7, "")
	elseif &filetype == 'cpp' ||&filetype == 'c'
	call append(0, " /*************************************************************************")
	call append(1, " > File Name: ".expand("%"))
	call append(2, " > Author: Skyrim")
	call append(3, " > Mail: xxxx@gmail.com ")
	call append(4, " > Created Time: ".strftime("%c"))
	call append(5, " ************************************************************************/")
	call append(6, "")
	elseif &filetype == 'python'
		
	call append(0, "\#-*- encoding=UTF-8 -*-")
	call append(1, "\#  File Name: ".expand("%"))
	call append(2, "\#  Author: Skyrim")
	call append(3, "\#  Mail: xxxx@gmail.com ")
	call append(4, "\#  Created Time: ".strftime("%c"))
	call append(5, "")
	endif
	if &filetype == 'cpp'
	call append(7, "#include<iostream>")
	call append(8, "using namespace std;")
	call append(9, "")
	endif
	if &filetype == 'c'
	call append(7, "#include<stdio.h>")
	call append(8, "")
	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc
"==================




"=========================
	"定义CompileRun函数，用来调用进行编译和运行
	func CompileRun()
	exec "w"
	"C程序
	if &filetype == 'c'
	exec "!gcc -Wall -std=c99 -enable-auto-import % -g -o %<.exe"
	"c++程序
	elseif &filetype == 'cpp'
	exec "!g++ % -g -o %<.exe"
	"Java程序
	elseif &filetype == 'java'
	exec "!javac %"
	endif
	endfunc
	"结束定义CompileRun
	"定义Run函数
	func Run()
	if &filetype == 'c' || &filetype == 'cpp'
	exec "!%<.exe"
	elseif &filetype == 'java'
	exec "!java %<"
	endif
	endfunc
	"定义Debug函数，用来调试程序
	func Debug()
	exec "w"
	"C程序
	if &filetype == 'c'
	exec "!gcc % -g -o %<.exe"
	exec "!gdb %<.exe"
	elseif &filetype == 'cpp'
	exec "!g++ % -g -o %<.exe"
	exec "!gdb %<.exe"
	"Java程序
	elseif &filetype == 'java'
	exec "!javac %"
	exec "!jdb %<"
	endif
	endfunc
	"结束定义Debug
	"设置程序的编译，运行,调试的快捷键F5,F6和F7
	map <F5> :call CompileRun()<CR>
	map <F6> :call Run()<CR>
	map <F7> :call Debug()<CR>
"===================================

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction



