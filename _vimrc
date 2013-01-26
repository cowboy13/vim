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

"���ô��ļ�������ϴδ�λ��
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif

"�����Զ����<leader>��ݼ�
let mapleader=","
let g:mapleader=","

"�����﷨��������ɫ����GUI������ʹ�����Զ����yytextmate.vim
if has("gui_running")
colorscheme molokai
else
colorscheme slate
endif
let g:molokai_original = 1
"���ұ���Ĺ���vim7Ĭ�϶���utf-8���򿪰���gbk�ַ����ļ���������룩
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"GUI����������壬Ĭ���п����
set guifont=consolas:h12:cANSI
"�м�࣬���Ĭ��ֵ̫С�������ǳ�����
set linespace=4
"��<>��������ʱ�ĳ���
set shiftwidth=4
"�Ʊ���ĳ��ȣ�ͳһΪ4���ո�Ŀ��
set smarttab
"4�ո����tab
set tabstop=4
set expandtab

"��ʼ���ڵĿ��
set columns=195
"��ʼ���ڵĸ߶�
set lines=45
"��ʼ���ڵ�λ��
winpos 52 42

"������ǰ��
set cursorline
"������ǰ��
"set cursorcolumn

" ����ʱ���Դ�Сд
set ignorecase
" ��Լ�:h magic�ɣ�һ�к��ѽ���
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

"��ʾ�к�
set number
"�к����Ŀ��
set numberwidth=4
 "��ֹ�Զ�����
"set nowrap
"����������ʱ�г�ƥ����Ŀ��Ҳ���ǽ�ͼ�ײ���Ч��
set wildmenu
"��ʾ���λ��
set ruler
"�ָ��ʱ������ȵĿ�/��
set equalalways

"ƥ�����ŵĹ���
set matchpairs=(:),{:},[:]
"ȡ���Զ�����
set nobackup
"����ر��ļ�֮ǰ����һ������
set writebackup

"��ʾ���������
set guioptions+=b
" ������ǰ�С���
"set cursorline
"set cursorcolumn

" ���¿�������
set scrolloff=6
"��ʷ
set history=1024
" �رմ�������
set noerrorbells
set novisualbell
set t_vb=
" �趨�����е�����Ϊ 1
set cmdheight=1
" ��ʾ״̬�� (Ĭ��ֵΪ 1, �޷���ʾ״̬��)
set laststatus=2
"" ״̬������״̬
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
"" ����״̬����ģʽ�ַ���
let statusString=statusHead.statusBody.statusBlank.statusEnd
set statusline=%!statusString


"��ʾ����������
set showmatch
" ��ʾTab��
set list
set listchars=tab:\|\ ,trail:-,extends:>,precedes:<
"��ǩ������
set tabpagemax=15
"���ô����۵���ʽΪ �ֹ�  indent(�Զ�)
"set foldmethod=indent

" ��javascript�۵�
let b:javascript_fold=1
" ��javascript��dom��html��css��֧��
let javascript_enable_domhtmlcss=1

" {{{ȫ������ѡ�е�����
vnoremap <silent> <leader>f y/<c-r>=escape(@", "\\/.*$^~[]")<cr><cr>
vnoremap <silent> <leader>F y?<c-r>=escape(@", "\\/.*$^~[]")<cr><cr>
" }}}

"esc��ݷ�ʽ
"imap jj <esc>

"�رմ���
map <leader>c :close<cr>

"tab�л�
map <c-tab> gt
map <c-s-tab> gT
"ɾ����β�ո�,tab�滻Ϊ�ո�
map <C-s><C-l> :%s/\s*$//g<cr>:nohl<cr>:retab!<cr>
"�ո��滻Ϊtab
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

"���������ļ�����
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

"�ֵ�
autocmd filetype javascript set dictionary=$VIM/dict/javascript.dict
autocmd filetype css set dictionary=$VIM/dict/css.dict
autocmd filetype php set dictionary=$VIM/dict/php.dic

"�ı�swp�ļ�·��
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
"<Leader>mt   - ��/�ر�ShowMarks���
"<Leader>mo   - ǿ�ƴ�ShowMarks���
"<Leader>mh   - �����ǰ�еı��
"<Leader>ma   - �����ǰ�����������еı��
"<Leader>mm   - �ڵ�ǰ�д�һ����ǣ�ʹ����һ�����õı����

""""""""""""""""""""""""""""""
" markbrowser setting
""""""""""""""""""""""""""""""
nmap <silent> <leader>mk :MarksBrowser<cr>

" ע��
nmap <F11> <leader>c<space>
nmap <C-F11> <leader>cu
vmap <F11> <leader>c<space>
vmap <C-F11> <leader>cu

" ָ�� jsLint ����·����ͨ�����ø���
let g:jslint_command = $VIM . '\vimfiles\etc\jsl\jsl.exe'
"" ָ�� jsLint ����������������ָ����Ӧ�������ļ�
let g:jslint_command_options = '-nofilelisting -nocontext -nosummary -nologo -process'
"" �������Ҫ���÷�ʽ
"autocmd BufWritePost,FileWritePost *.js call JsonLint()
""��ʵ���ĺ����� JsonLint() �����Կ��԰󶨿�ݼ����������κ�ʱ�����������
map <C-s><C-j> :call JsonLint()<cr>

"quickfix
":cc                ��ʾ��ϸ������Ϣ ( :help :cc )
":cp                ������һ������ ( :help :cp )
":cn                ������һ������ ( :help :cn )
":cl                �г����д��� ( :help :cl )
":cw                ����д����б����quickfix���� ( :help :cw )
":col               ��ǰһ���ɵĴ����б� ( :help :col )
":cnew              ����һ�����µĴ����б� ( :help :cnew )
autocmd FileType c,cpp  map <buffer> <leader><space> :w<cr>:make<cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>

"minibuf
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

" ��ʼ�Ż�����js�ļ�
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
let Tlist_Show_One_File = 1            " ��ͬʱ��ʾ����ļ���tag��ֻ��ʾ��ǰ�ļ���
let Tlist_Exit_OnlyWindow = 1          " ���taglist���������һ�����ڣ����˳�vim
let Tlist_Use_Right_Window = 1         " ���Ҳര������ʾtaglist����
let Tlist_File_Fold_Auto_Close=1       " �Զ��۵���ǰ�Ǳ༭�ļ��ķ����б�
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1


