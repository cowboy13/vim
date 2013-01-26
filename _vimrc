filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

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

"设置打开文件光标在上次打开位置
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif

"设置自定义的<leader>快捷键
let mapleader=","
let g:mapleader=","

"设置语法高亮的配色，在GUI界面里使用我自定义的yytextmate.vim
if has("gui_running")
colorscheme molokai
else
colorscheme slate
endif
let g:molokai_original = 1
"查找编码的规则（vim7默认都用utf-8，打开包含gbk字符的文件会出现乱码）
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"GUI界面里的字体，默认有抗锯齿
set guifont=consolas:h12:cANSI
"行间距，如果默认值太小，代码会非常纠结
set linespace=4
"用<>调整缩进时的长度
set shiftwidth=4
"制表符的长度，统一为4个空格的宽度
set smarttab
"4空格代替tab
set tabstop=4
set expandtab

"初始窗口的宽度
set columns=195
"初始窗口的高度
set lines=45
"初始窗口的位置
winpos 52 42

"高亮当前行
set cursorline
"高亮当前列
"set cursorcolumn

" 搜索时忽略大小写
set ignorecase
" 额，自己:h magic吧，一行很难解释
set magic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

"显示行号
set number
"行号栏的宽度
set numberwidth=4
 "禁止自动换行
"set nowrap
"在输入命令时列出匹配项目，也就是截图底部的效果
set wildmenu
"显示光标位置
set ruler
"分割窗口时保持相等的宽/高
set equalalways

"匹配括号的规则
set matchpairs=(:),{:},[:]
"取消自动备份
set nobackup
"保存关闭文件之前保留一个备份
set writebackup

"显示横向滚动条
set guioptions+=b
" 高亮当前行、列
"set cursorline
"set cursorcolumn

" 上下可视行数
set scrolloff=6
"历史
set history=1024
" 关闭错误声音
set noerrorbells
set novisualbell
set t_vb=
" 设定命令行的行数为 1
set cmdheight=1
" 显示状态栏 (默认值为 1, 无法显示状态栏)
set laststatus=2
"" 状态栏各个状态
let statusHead         ="%-.50f\ %h%m%r"
let statusBreakPoint   ="%<"
let statusSeparator      ="|"
let statusFileType      ="%{((&ft\ ==\ \"help\"\ \|\|\ &ft\ ==\ \"\")?\"\":\"[\".&ft.\"]\")}"
let statusFileFormat    ="[%{(&ff\ ==\ \"unix\")?\"u\":\"d\"}]"
let statusAscii         ="\{%b:0x%B\}"
let statusCwd         ="%-.50{getcwd()}"
let statusBody         =statusFileType.statusFileFormat.statusSeparator.statusAscii.statusSeparator."\ ".statusBreakPoint.statusCwd
let statusEncoding      ="[%{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]"
let statusBlank         ="%="
let statusKeymap      ="%k"
let statusRuler         ="%-12.(%lL,%cC%)\ %P"
let statusTime         ="%{strftime(\"%Y-%m-%d\ %H:%M\")}"
let statusEnd=statusKeymap."\ ".statusEncoding.statusRuler."\ ".statusTime
"" 最终状态栏的模式字符串
let statusString=statusHead.statusBody.statusBlank.statusEnd
set statusline=%!statusString


"显示括号配对情况
set showmatch
" 显示Tab符
set list
set listchars=tab:\|\ ,trail:-,extends:>,precedes:<
"标签最大个数
set tabpagemax=15
"设置代码折叠方式为 手工  indent(自动)
"set foldmethod=indent

" 打开javascript折叠
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1

" {{{全文搜索选中的文字
vnoremap <silent> <leader>f y/<c-r>=escape(@", "\\/.*$^~[]")<cr><cr>
vnoremap <silent> <leader>F y?<c-r>=escape(@", "\\/.*$^~[]")<cr><cr>
" }}}

"esc快捷方式
"imap jj <esc>

"关闭窗口
map <leader>c :close<cr>

"tab切换
map <c-tab> gt
map <c-s-tab> gT
"删除行尾空格,tab替换为空格
map <C-s><C-l> :%s/\s*$//g<cr>:nohl<cr>:retab!<cr>
"空格替换为tab
":set noexpandtab

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :bd<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

"快速设置文件类型
nnoremap <leader>1 :set filetype=xhtml<CR>
nnoremap <leader>2 :set filetype=css<CR>
nnoremap <leader>3 :set filetype=javascript<CR>
nnoremap <leader>4 :set filetype=php<CR>

noremap! <M-j> <Down>
noremap! <M-k> <Up>
noremap! <M-h> <left>
noremap! <M-l> <Right>

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F3> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

"字典
autocmd filetype javascript set dictionary=$VIM/dict/javascript.dict
autocmd filetype css set dictionary=$VIM/dict/css.dict
autocmd filetype php set dictionary=$VIM/dict/php.dic

"改变swp文件路径
set directory=$VIM/tmp,/tmp

"zencoding
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

"NERD Tree
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
nnoremap <F2> :NERDTreeToggle<cr>

""""""""""""""""""""""""""""""
" showmarks setting
""""""""""""""""""""""""""""""
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1
"<Leader>mt   - 打开/关闭ShowMarks插件
"<Leader>mo   - 强制打开ShowMarks插件
"<Leader>mh   - 清除当前行的标记
"<Leader>ma   - 清除当前缓冲区中所有的标记
"<Leader>mm   - 在当前行打一个标记，使用下一个可用的标记名

""""""""""""""""""""""""""""""
" markbrowser setting
""""""""""""""""""""""""""""""
nmap <silent> <leader>mk :MarksBrowser<cr>

" 注释
nmap <F11> <leader>c<space>
nmap <C-F11> <leader>cu
vmap <F11> <leader>c<space>
vmap <C-F11> <leader>cu

" 指定 jsLint 调用路径，通常不用更改
let g:jslint_command = $VIM . '\vimfiles\etc\jsl\jsl.exe'
"" 指定 jsLint 的启动参数，可以指定相应的配置文件
let g:jslint_command_options = '-nofilelisting -nocontext -nosummary -nologo -process'
"" 插件的主要调用方式
"autocmd BufWritePost,FileWritePost *.js call JsonLint()
""其实核心函数是 JsonLint() ，所以可以绑定快捷键，用于在任何时候检查错误。例如
map <C-s><C-j> :call JsonLint()<cr>

"quickfix
":cc                显示详细错误信息 ( :help :cc )
":cp                跳到上一个错误 ( :help :cp )
":cn                跳到下一个错误 ( :help :cn )
":cl                列出所有错误 ( :help :cl )
":cw                如果有错误列表，则打开quickfix窗口 ( :help :cw )
":col               到前一个旧的错误列表 ( :help :col )
":cnew              到后一个较新的错误列表 ( :help :cnew )
autocmd FileType c,cpp  map <buffer> <leader><space> :w<cr>:make<cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>

"minibuf
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

" 开始优化整个js文件
nmap <leader>js :call g:Jsbeautify()<cr>:%retab<cr>

"mark.vim
"That will use ,m ,r ,n instead of \m \r \n as the trigger

"Json
augroup json_autocmd
  autocmd!
  autocmd FileType json set expandtab
  autocmd FileType json set smarttab
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=4
  autocmd FileType json set softtabstop=4 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END


"buffer
"                 ":BufExplorer"                - Opens BE.
"                 ":BufExplorerHorizontalSplit" - Opens horizontally window BE.
"                 ":BufExplorerVerticalSplit"   - Opens vertically window BE.
"
map <leader>bb :BufExplorerHorizontalSplit<enter>

"jquery
au BufRead,BufNewFile *.js set syntax=jquery

"pydoc
let g:pydoc_cmd = "C:/Python27/Doc"

" Use neocomplcache.
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
inoremap <expr><space>  pumvisible() ? neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"
"let g:neocomplcache_disable_auto_complete = 1
"let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)

"javascript indent
let g:SimpleJsIndenter_BriefMode = 1

"taglist
nnoremap <silent><F4> :TlistToggle<CR>
let Tlist_Show_One_File = 1            " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         " 在右侧窗口中显示taglist窗口
let Tlist_File_Fold_Auto_Close=1       " 自动折叠当前非编辑文件的方法列表
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1


