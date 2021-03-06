"使用 vundule 管理vim插件
filetype off " required!
if(has("win32") || has("win64"))
	let g:iswindows=1
else
	let g:iswindows=0
endif

if g:iswindows==1
	if has('vim_starting')
		set runtimepath+=D:\installed\vim_set\bundle\neobundle.vim
	endif
	call neobundle#rc(expand('D:\installed\vim_set\bundle'))

	set guifont=Lucida\ Console:h20:cANSI
	set guifontwide=Lucida\ Console:h20:cGB2312

	nmap <silent> <Leader>ee :e C:\Program Files (x86)\Vim\_vimrc <CR>
else
	if has('vim_starting')
		set runtimepath+=~/.vim/bundle/neobundle.vim/
	endif
	call neobundle#rc(expand('~/.vim/bundle/'))

	nmap <silent> <Leader>ee :e ~/.vimrc <CR>
	map <silent> <Leader>rs :source ~/.vimrc <CR>
endif

NeoBundle 'Shougo/vimproc'

" C/C++
NeoBundle 'a.vim'
NeoBundle 'echofunc.vim'
NeoBundle 'FencView.vim'
NeoBundle 'Twinside/vim-cuteErrorMarker'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Lokaltog/TagHighlight'

" Python
NeoBundle 'kevinw/pyflakes-vim'
NeoBundle 'indentpython.vim'
NeoBundle 'hdima/python-syntax'

" Tools
NeoBundle 'motemen/git-vim'
NeoBundle 'airblade/vim-gitgutter'
" NeoBundle 'sessions.vim'
NeoBundle 'mru.vim'
NeoBundle 'YankRing.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'shellinsidevim.vim'
NeoBundle 'FuzzyFinder'
NeoBundle 'cmdline-completion'
" NeoBundle 'AuthorInfo'
NeoBundle 'bufexplorer.zip'
NeoBundle 'tomasr/molokai', 'eb4dfe083'
NeoBundle 'DrawIt'
NeoBundle 'renamer.vim'
NeoBundle 'transpose-words'
NeoBundle 'toggle_words.vim'
NeoBundle 'Tabular'
NeoBundle 'VisIncr'
NeoBundle 'Mark'
NeoBundle 'tpope/vim-surround'
NeoBundle 'delimitMate.vim'
NeoBundle 'grep.vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'Gundo'
NeoBundle 'L9'
NeoBundle 'genutils'
NeoBundle 'autoproto.vim'
NeoBundle 'jiangmiao/auto-pairs'
" NeoBundle 'QuickFixCurrentNumber'

"NeoBundle 'tpope/vim-afterimage'
"NeoBundle 'Engspchk'
"NeoBundle 'quickfixsigns'

" HTML/PHP
NeoBundle 'MatchTag'
NeoBundle 'lepture/vim-javascript'

"NeoBundle 'matchit.zip'
"NeoBundle 'phpErrorMarker'
"NeoBundle 'jsbeautify'
" NeoBundle 'JavaScript-syntax'
"NeoBundle 'pangloss/vim-javascript'
" NeoBundle 'xml.vim'

filetype on
filetype plugin on
filetype plugin indent on

 " Brief help
 " :NeoBundleList          - list configured bundles
 " :NeoBundleInstall(!)    - install(update) bundles
 " :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

 " Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
		\ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

"基本配置
set backspace=eol,start,indent
set nocompatible        "去掉有关vi一致性模式，避免以前版本的一些bug和局限
set number				"显示行号
set updatecount=100		"设置击键 updatecount 次数后更新交换文件
set history=200			"记录历史的行数

set wildmenu
set wildmode=longest:full:list	" auto completion and menu
set completeopt=longest,menuone " text completion settings

set scrolloff=5			"设定光标离窗口上下边界 5 行时窗口自动滚动
set cindent				"打开自动缩进和 C 语言风格的缩进模式,定制 C 语言缩进风格
set softtabstop=4
set tabstop=4			"设置tab键为4个空格
set shiftwidth=4		"设置当行之间交错时使用4个空格
set sta					"插入时使用'shiftwidth'
set autoindent			"vim使用自动对起，把当前行的对起格式应用到下一行；
set smartindent			"依据上面的对起格式，智能的选择对起方式，对于类似C语言编写上很有用
set showmatch			"设置匹配模式，输入一个左括号时会匹配相应的右括号
set autochdir

set ruler				"在编辑过程中，在右下角显示光标位置的状态行
" set wrap				"内容多时,换行显示
set linebreak			"整词换行
set whichwrap+=<,>	"光标从行首和行末时可以跳到另一行去

set cursorline
set cursorcolumn
hi CursorLine cterm=bold ctermbg=DarkBlue

syntax enable			"设置高亮关键字显示
syntax on				"语法高亮度显示
set hlsearch			"在查找时，高亮匹配字符串	:set nohlsearch
set incsearch			"查询时实时匹配符合条件的字符串
set ignorecase			"搜索时忽略大小写   :set noignorecase
set smartcase			"但在有一个或以上大写字母时,仍保持对大小写敏感
"set spell	            "开启拼写检查功能		:set nospell 关闭拼写检查功能
set gdefault			"替换时所有的行内匹配都被替换，而不是只有第一个
set magic				"魔法配置搜索时可使用特殊符号,for regular expressions

set winaltkeys=no		"Alt组合键不映射到菜单上
set hid					"允许在有未保存的修改时切换缓冲区，此时的修改切换由 vim 负责保存


" syntax match logline "^.\{80,}$"
au BufRead,BufNewFile *.asm,*.c,*.cpp,*.java,*.cs,*.sh,*.lua,*.pl,*.pm,*.py,*.rb,*.hs,*.vim 2match Underlined /.\%81v/
" set formatoptions+=tcqlnm
set winminheight=0   	"window minimum height
set shortmess=atI
if v:version > 702
	" set textwidth=110
	set cc=110
endif

set ffs=unix,dos,mac	"Default file types
set wildignore+=*.pyc	"tab键的自动完成忽略这些,影响代码提示
set wildignore+=*.o	"tab键的自动完成忽略这些,影响代码提示

let mapleader = ","

map <Leader>bi :NeoBundleInstall<CR>


" 用默认的程序打开文件 TODO: xdg-open 的配置在哪里？
nmap <F9> :!xdg-open %<CR>

"Insert current time.
map <F8> O// <C-R>=strftime("%c")<CR><ESC>^

"Fast editing of .vimrc
nmap <silent> <Leader>ee :e ~/.vimrc <CR>

"Fast reloading of the .vimrc
map <silent> <Leader>rs :source ~/.vimrc <CR>

"When .vimrc file is edited, reload it TODO:
" autocmd bufwritepost ~/.vimrc source ~/.vimrc

map <silent> <Leader>ss :e %<CR>

"diffsplit [file]		"水平分割窗口进行文件比较
"vertical diffsplit [file]	"竖直分割窗口进行文件比较

"缩进线设置
set list
set ambiwidth=single
" 注意: \|\后面有个空格
set lcs=tab:\┆\ 

inoremap jk <ESC>
inoremap ,, <ESC>
inoremap ;; <ESC>:update<CR>
map ;; :update<CR>
inoremap zz <ESC>:update<CR>
map zz :update<CR>
inoremap ZZ <ESC>:update<CR>:q<CR>
map ZZ <ESC>:update<CR>:q<CR>

map <Leader>q :q!<CR>
map Q :q<CR>
map qq :q<CR>
map <Leader>aq :qall<CR>


nmap <leader>w :w!<cr>	"Fast saving
nmap <Leader>ws :w !sudo tee % > /dev/null<CR>		
"
set autoread			"Set to auto read when a file is changed from the outside
set autowrite
set lazyredraw			"执行宏、寄存器和其它不通过输入的命令时屏幕不会重画

"Smart way to move btw. window
map <esc>h <C-W>h
map <esc>l <C-W>l
map <esc>k <C-W>k
map <esc>j <C-W>j

map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-k> <C-W>k
map <C-j> <C-W>j

"Tab configuration
map <Leader>nt :tabnew<CR>
map <Leader>tn :tabnext<CR>		" gt
map <Leader>tp :tabprevious<CR>
map <Leader>te :tabedit
map <Leader>tc :tabclose<CR>
map <Leader>tm :tabmove<CR>
map <leader>bc :call <SID>BufcloseCloseIt()<CR>

map <esc>n :tabnext<CR>
map <esc>p :tabprevious<CR>

"======================================================================
" 窗口分割操作的快捷键
"======================================================================
nmap wv     <C-w>v     " 垂直分割当前窗口
nmap wc     <C-w>c     " 关闭当前窗口
nmap ws     <C-w>s     " 水平分割当前窗口

map <Leader>bb :%!xxd<CR>
map <Leader>br :%!xxd -r<CR>

"Ctrl+V键粘贴
inoremap <C-v> <esc>a<space><esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

"设置cscope，是否使用 quickfix 窗口来显示 cscope 结果, " <C-_>s的按法是先按"Ctrl+Shift+-",然后很快再按"s"
set cscopequickfix=s-,c-,d-,i-,t-,e-
"set cscopetag        "用cscope 代替 ctags
if has("cscope") && executable("cscope")
	" 设置 [[[2
	set csto=1
	set cst
	set cscopequickfix=s-,c-,d-,i-,t-,e-

	" add any database in current directory
	function Lilydjwg_csadd()
		set nocsverb
		if filereadable("cscope.out")
			cs add cscope.out
		endif
		set csverb
	endfunction

	autocmd FileType c,cpp call Lilydjwg_csadd()

	" 映射 [[[2
	" 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
	nmap css :cs find s <C-R>=expand("<cword>")<CR><CR>
	" 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
	nmap csg :cs find g <C-R>=expand("<cword>")<CR><CR>
	" 查找本函数调用的函数
	nmap csd :cs find d <C-R>=expand("<cword>")<CR><CR>
	" 查找调用本函数的函数
	nmap csc :cs find c <C-R>=expand("<cword>")<CR><CR>
	" 查找指定的字符串
	nmap cst :cs find t <C-R>=expand("<cword>")<CR><CR>
	" 查找egrep模式，相当于egrep功能，但查找速度快多了
	nmap cse :cs find e <C-R>=expand("<cword>")<CR><CR>
	" 查找并打开文件，类似vim的find功能
	nmap csf :cs find f <C-R>=expand("<cfile>")<CR><CR>
	" 查找包含本文件的文件
	nmap csi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	" 生成新的数据库
	" nmap csn :lcd %:p:h<CR>:!my_cscope<CR>
	nmap csn :lcd %:p:h<CR>:!my_cscope.sh<CR>
	" 自己来输入命令
	nmap cs<Space> :cs find
endif


"======================================================================
" 状态栏设置
"======================================================================
set laststatus=2     " always show the status line
set statusline=[%F]%y%r%m%*%=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}\ [C:%c,\ L:%l/%L,\ %p%%]\ %=[%{GitBranch()}]
" set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ %=[%{GitBranch()}]


"======================================================================
" programming set
"======================================================================
autocmd FileType c,cpp,java,lua,javascript,css inoremap { {}<LEFT><CR><UP><ESC>$a<CR>
autocmd FileType python,ks set expandtab
autocmd FileType python map <buffer> <Space> :update<CR>:!python2 %<CR>
autocmd FileType perl map <buffer> <Space> :update<CR>:!perl %<CR>


"======================================================================
" dictionary
"======================================================================
nmap <c-e> :call Mydict()<CR>
function! Mydict()
	let expl=system('sdcv -n ' .
				\  expand("<cword>"))
	windo if
				\ expand("%")=="diCt-tmp" |
				\ q!|endif
	25vsp diCt-tmp
	setlocal buftype=nofile bufhidden=hide noswapfile
	1s/^/\=expl/
	1
endfunction

"======================================================================
" About tags
"======================================================================
"当保存文件时自动调用 ctags：
au BufWritePost *.cpp,*.h,*.c,*.def,*.py,*.java,*.html call system("ctags")
" au BufWritePost *.cpp,*.h,*.c,*.def call system("ctags -R --c++-kinds=+px --fields=+iaS  --extra=+q")

set tags+=~/.vim/stl_tags
set tags+=tags
set tags+=~/.vim/systags 	"autoproto.vim

"======================================================================
" plugin - shellinsidevim.vim
"======================================================================
" map <silent> <F3> :call ToggleOutputWindow()<CR>
let g:ShowOutputWindowWhenVimLaunched=0
let g:AutoShowOutputWindow=0
let g:ShowOutputInCommandline=1
" map <unique> <silent> <F3> :call <SID>ToggleOutputWindow()<CR>
" map <silent> <C-F3> :messages<CR>
" imap <unique> <silent> <F3> <ESC><F3>a
" imap <silent> <C-F3> <ESC><C-F3>a
map <C-C> :Shell<Space>


"======================================================================
" plugin - toggle_words.vim : toggle words like:'true'=>'false', 'True'=>'False' etc
"======================================================================
nmap <leader>ch : ToggleWord<CR>


"======================================================================
"Markdown to HTML
"======================================================================
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
nmap <leader>md :Shell rm ~/markdown.html<CR>:%!~/Yunio/script/Markdown.pl --html4tags<CR>:w ~/markdown.html<CR>u


"======================================================================
" plugin - pyflakes.vim
"======================================================================
if has("gui_running")
	highlight SpellBad term=underline gui=undercurl guisp=Orange
else
	set background=dark			"背景使用黑色
endif

"======================================================================
" plugin - git-vim
"======================================================================
let g:git_no_map_default=1
nnoremap <Leader>gd :GitDiff<Enter>
nnoremap <Leader>gD :GitDiff --cached<Enter>
nnoremap <Leader>gs :GitStatus<Enter>
nnoremap <Leader>gl :GitLog<Enter>
nnoremap <Leader>ga :GitAdd<Space>
"nnoremap <Leader>gc :GitCommit -a -m ''<Left>
nnoremap <Leader>gc :GitCommit -a<CR>
nnoremap <Leader>gp :GitPush -u origin master<CR>


"======================================================================
" plugin - vim-gitgutter
"======================================================================
let g:gitgutter_enabled = 1

"======================================================================
" plugin - autopreview
"======================================================================
" let g:AutoPreview_enabled=1
" nnoremap <F6> :AutoPreviewToggle<CR>
" inoremap <F6><ESC> :AutoPreviewToggle<CR>i
" set updatetime=500


"======================================================================
" plugin - sessions.vim 会话记录
"======================================================================
"  :SS <name> --- save session <name>
"  :SL <name> --- load session <name>
"  :SN <name> --- clear buffer list and set new current session name.
"  :SS without parameter saves current session loaded with :SL or created
"      with SN.
"  :SM <name> --- merge session <name> into current one.
" map <S-L> :SL<Space>


"======================================================================
" plguin - transwrd.vim : transpose-word : http://www.vim.org/scripts/script.php?script_id=3656
"======================================================================
nmap <Leader>tw <Plug>Transposewords
imap <Leader>tw <Plug>Transposewords
cmap <Leader>tw <Plug>Transposewords


"======================================================================
" plguin - renamer.vim
"======================================================================
" :Renamer in files folder
" :Ren modify files name.


"======================================================================
" plguin - Drawlt.vim
"======================================================================
",di 启动， ,ds 关闭
"上下左右键: 直线绘图
"home,end,pgup,pgdn: 斜线的绘制
"多行表格: y一行，然后p 多行；多列的话，就是ctrl+v进入列模式，然后还是y,p就行


"======================================================================
" plguin - Grep
"======================================================================
nnoremap <silent> <F3> :Grep<CR>


"======================================================================
" plguin - Notes
"======================================================================
map <Leader>nn :cd ~/.notes<CR>:e<Space>
map <Leader>nc :cd ~/Yunio/code/<CR>:e<Space>


"======================================================================
" plguin - NERD_commenter.vim : http://www.vim.org/scripts/script.php?script_id=1218
"======================================================================
" ,cc : add comment at the begin of multiply lines
" ,cu : cacel comment
" ,cA : add coment at the end of line
" ,cs : comments out the selected lines "sexily"
"
let NERD_c_alt_style = 1     " 将C语言的注释符号改为//, 默认是/**/
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看


"======================================================================
" plguin - nerdtree
"======================================================================
"http://hi.baidu.com/%BA%E9%D4%F3%BA%FE%B0%B6/blog/item/4a223580cf9079af0cf4d22a.html
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeMouseMode=3
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=25
"let NERDTreeQuitOnOpen=1
let NERDTreeBookmarksFile = $HOME.'/. vim/NerdTreeBookmarks'
nmap <Leader>no :NERDTreeToggle<CR>


"======================================================================
" plguin - AuthorInfo设置
"======================================================================
let g:vimrc_author=''
let g:vimrc_email=''
let g:vimrc_homepage=''
nmap <F7> :AuthorInfoDetect<CR>


"======================================================================
" plugin - tagbar.vim
"======================================================================
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
let g:tagbar_left = 1
let g:tagbar_autoclose = 0


"======================================================================
" 代码折叠:
"======================================================================
set foldmethod=indent
"set foldmethod=syntax
"set foldlevelstart=99
"set foldopen=all	"光标移动到折叠位置时自动打开折叠
"set foldclose=all	"光标移出折叠代码后自动折叠起代码


"======================================================================
" plguin - FuzzyFinurl
"======================================================================
"分割窗口打开新的文件
"Ctrl-n , Ctrl-p上下选择项目
"Ctrl-j开启该档案到水平分割视窗
"Ctrl-k开启该档案到垂直分割视窗
"Ctrl-l开启档案至新分页
nmap <silent> <leader>ff : FufFile<CR>
nmap <silent> <leader>fb : FufBuffer<CR>
" nmap <silent> <leader>fs : FufCoverageFile<CR>
"nmap <silent> <leader>fd : FufDir<CR>
nmap <silent> <leader>fm : FufMruFile<CR>	"How to use it ?

let g:fuf_dataDir = $HOME.'/.vimtmp/vim-fuf-data'
" let g:fuf_dataDir = '/dev/shm/vimtmp/vim-fuf-data'


"======================================================================
" plugin - bufexplorer.zip
"======================================================================
" '\be' normal open
" '\bs' force horizontal split open
" '\bv' force vertical split open
" In bufexplorer window, 'd/D' delete the

map <leader>be :BufExplorer<CR>
map <leader>o :BufExplorer<CR>
let g:bufExplorerDetailedHelp=1      " Show detailed help.
" let g:bufExplorerDefaultHelp=1       " Show default help.
" let g:bufExplorerShowUnlisted=1      " Show unlisted buffers.


"======================================================================
" plguin -  mru.vim
"======================================================================
" :MRU
" :MRU filename
let MRU_Max_Entries = 100
map <leader>mm :MRU<CR>
if g:iswindows == 0
	let g:MRU_File = $HOME.'/.vimtmp/vim_mru_files'
else
endif


"======================================================================
" plugin - surround.vim
"======================================================================
"()[]{}: 左括号添加空格, 右括号不添加空格.

" ds'		delete '
" dst		delete HTML <Tag>. <div>Yo!</div>

" cs"'		change " to '
" cs'<q>	change ' to <q>iii</q>
" <cst<p>	change HTML <Tag> to <p>. div>Yo!*</div>                 <p>Yo!</p>

" ysiw]		add ]
" csw]      add ]
" ysiw<em>	add <em>, auto add <
" yss}	   add {} on current line.  Hello w*orld!         {Hello world!}
" ySS*     add * include current line, * at new line
"
" Vim 自带快捷键: 把 i 改成 a 的话，会连配对标点一起操作
" ci’、ci”、ci(、ci[、ci{、ci< – 分别更改这些配对标点符号中的文本内容
" di’、di”、di(、di[、di{、di< – 分别删除这些配对标点符号中的文本内容
" yi’、yi”、yi(、yi[、yi{、yi< – 分别复制这些配对标点符号中的文本内容


"======================================================================
" {{{ plguin - FencView:自动识别编码,在Gvim下可以通过tools-》encoding菜单选择编码
"======================================================================
"FencAutoDetect ：自动识别文件编码
"FencView：打开一个编码列表窗口，用户选择编码reload文件

let g:fencview_autodetect = 1   "打开文件时自动识别编码
let g:fencview_checklines = 10 "检查前后10行来判断编码


"======================================================================
" {{{ plugin - YankRing.vim
"======================================================================
map <Leader>l :YRShow<CR>
let g:yankring_history_dir = $HOME.'/.vimtmp'
" let g:yankring_history_dir = '/dev/shm/vimtmp'


"======================================================================
" plugin - 'Shougo/neosnippet'
"======================================================================
imap <ESC>k     <Plug>(neosnippet_expand_or_jump)
smap <ESC>k     <Plug>(neosnippet_expand_or_jump)
xmap <ESC>k     <Plug>(neosnippet_expand_target)
" imap <S-TAB>     <Plug>(neocomplcache_snippets_expand)
" smap <S-TAB>     <Plug>(neocomplcache_snippets_expand)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


"======================================================================
" plugin - 'Shougo/neocomplete'
"======================================================================
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'



"======================================================================
" plguin - echofunc.vim : 在控制栏显示函数定义
"======================================================================
let g:EchoFuncKeyPrev='<esc>p'
let g:EchoFuncKeyNext='<esc>n'


"======================================================================
" Tab set -- like SuperTab.vim
"======================================================================
inoremap <C-Tab> <Tab>
inoremap <silent> <Tab> <C-r>=<SID>i_Tab_plus()<CR>
inoremap <silent> <expr> <S-Tab> pumvisible()?"\<C-p>":"\<C-d>"

function! s:i_Tab_plus()
	let preChar = getline('.')[col('.') - 2]
	if pumvisible()
		"       return "\<Down>"
		return "\<C-n>"
	elseif preChar == '' || preChar =~ '\s'
		return "\<Tab>"
	elseif (getline('.')[col('.') - 3] == '-' && preChar == '>') || preChar == '.'
		"       return "\<C-x>\<C-o>\<C-r>=I_OnPopupPost()\<CR>"
		return "\<C-x>\<C-o>"
	elseif &ft ==# 'c' || &ft ==# 'cpp'
		return "\<C-n>"
	else
		"       call feedkeys("\<C-x>\<C-n>" . "\<C-r>=I_OnPopupPost()\<CR>", 'n')
		"       return ''
		"       return "\<C-x>\<C-n>\<C-r>=I_OnPopupPost()\<CR>"
		return "\<C-x>\<C-n>"
	endif
endf


"======================================================================
" JAVA
"======================================================================
autocmd FileType java map <buffer> <Space> :update<CR>:call MyFunc()<CR>
function! MyFunc()
	!javac %
	" && !java %<
	" !jikes %
	if !v:shell_error
		!java %<
	endif
endfunction


"======================================================================
" script set
"======================================================================
autocmd FileType sh map <buffer><Space> :update<CR>:!./%<CR>


"======================================================================
" 单个文件编译 和 make设置
"======================================================================
autocmd FileType c,cpp map <buffer><Space> :update<CR>:call Do_OneFileMake()<CR>
autocmd FileType c,cpp map <buffer>;<Space> :!./%< <Space>

function Do_OneFileMake()
  if expand("%:p:h")!=getcwd()
    echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press <F7> to redirect to the dir of this file." | echohl None
    return
  endif
  let sourcefileename=expand("%:t")
  if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c"))
  " if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c" && &filetype!="java"))
    echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
    return
  endif
  let deletedspacefilename=substitute(sourcefileename,' ','','g')
  if strlen(deletedspacefilename)!=strlen(sourcefileename)
    echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
    return
  endif
  if &filetype=="c"
    if g:iswindows==1
      set makeprg=gcc\ -g\ -o\ %<.exe\ %
    else
	  set makeprg=gcc\ -Wall\ -g\ -std=c99\ -o\ %<\ -lpthread\ %
    endif
  elseif &filetype=="cpp"
    if g:iswindows==1
      set makeprg=g++\ -g\ -o\ %<.exe\ %
    else
      set makeprg=g++\ -Wall\ -g\ -o\ %<\ -lpthread\ %
    endif
  endif

  if(g:iswindows==1)
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)$','.exe','g')
    let toexename=outfilename
  else
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)$','','g')
    let toexename=outfilename
  endif

  " if &filetype=="java"
	  " set outfilename="hello"
	  " let toexename=outfilename
  " endif

  if filereadable(outfilename)
    if(g:iswindows==1)
      let outdeletedsuccess=delete(getcwd()."\\".outfilename)
    else
      let outdeletedsuccess=delete("./".outfilename)
    endif
    if(outdeletedsuccess!=0)
      set makeprg=make
      echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
      return
    endif
  endif
  " execute "silent make"
  " set makeprg=make
  " execute "copen 5"
  execute "make"

  execute "normal :"
  if filereadable(outfilename)
	  if(g:iswindows==1)
		  execute "!".toexename
	  else
		  execute "!./".toexename
	  endif
  else
	  execute "copen 5"
  endif
endfunction

"进行make的设置
map <F5> :call Do_make()<CR>
map <C-F5> :silent make clean<CR>
map <F6> :silent make clean<CR>
function Do_make()
  set makeprg=make
  execute "silent make"
  execute "copen 5"
endfunction


"======================================================================
" 解决中文编码问题
"======================================================================
"set langmenu=zh_CN.UTF-8
"language messages zh_CN.UTF-8
"set fenc=cp936
"set enc=chinese			"设置编码为中文
"set helplang=cn			"设置帮助的语言为中文
if g:iswindows == 1
	set termencoding=utf-8
	set encoding=UTF-8
	set fileencoding=utf-8
endif
map <Leader>utf :set fileencoding=utf-8<CR>
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" if(g:iswindows==1)
	" source $VIMRUNTIME/delmenu.vim
	" source $VIMRUNTIME/menu.vim
	" "language messages zh_CN.utf-8
" endif
" if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
	" set ambiwidth=double
" endif
set nobomb



"======================================================================
" plugin - Tabular
"======================================================================
" :Tab /符号    符号为对齐所依据的符号
" :Tab /符号\zs  对齐后符号两边有空格.

map <Leader>t :Tab /

if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
	let p = '^\s*|\s.*\s|\s*$'
	if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
		let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
		let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
		Tabularize/|/l1
		normal! 0
		call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
	endif
endfunction


"======================================================================
" color - molokai
"======================================================================
" set t_Co=256
" set background=dark
"let g:molokai_original = 1


if has("gui_running")
	"set nowrap
	set guioptions+=b		"添加一个水平滚动条
	set mousemodel=popup	"GUI当右键单击窗口的时候，弹出快捷菜单"
	set guioptions-=T		"Dont show the tools.
	" set guioptions-=m
	" set guifont=Monaco\ 11
	" set guifontwide=Monospace\ 11
	set guifont=droid\ sans\ mono\ 11
	set guifontwide=droid\ sans\ mono\ 11
endif


"======================================================================
" plguin - Mark.vim : http://www.vim.org/scripts/script.php?script_id=1238
"======================================================================
" ,hl : 光标下的单词高亮
" ,hh : 清除该单词的高亮,如果在高亮单词外输入”,hh“，会清除所有的高亮
" 使用”,#“或”,*“来上下搜索高亮文本。在使用了”,#“或”,*“后，就可以直接输入”#“或”*“来继续查找该高亮文本，直到你又用”#“或”*“查找了其它文本。
" 使用virsual模式选中一段文本，然后按”,hl“，会高亮你所选中的文本；或者你可以用”,hr“来输入一个正则表达式，这会高亮所有符合这个正则表达式的文本。

nmap <silent> <leader>hl <Plug>MarkSet
vmap <silent> <leader>hl <Plug>MarkSet
nmap <silent> <leader>hh <Plug>MarkClear
vmap <silent> <leader>hh <Plug>MarkClear
nmap <silent> <leader>hr <Plug>MarkRegex
vmap <silent> <leader>hr <Plug>MarkRegex


"======================================================================
" plugin - Gundo
"======================================================================
map <Leader>un :GundoToggle<CR>  " F5 激活Gundo
" let g:gundo_debug = 1


"======================================================================
" 让 gvim 支持 Alt+n 来切换标签页
"======================================================================
function! BufPos_Initialize()
	for a in range(1,9)
		exe 'map <A-' . a . '> ' . a . 'gt'
	endfor
endfunction
autocmd VimEnter * call BufPos_Initialize()

 "alt+左右键来移动标签
nn <silent> <M-left> :if tabpagenr() == 1\|exe "tabm ".tabpagenr("$")\|el\|exe "tabm ".(tabpagenr()-2)\|en<CR>
nn <silent> <M-right> :if tabpagenr() == tabpagenr("$")\|tabm 0\|el\|exe "tabm ".tabpagenr()\|en<CR>

set guitablabel=%N\ %t\ %M



" 指定viminfo的位置
" if has("win32")
	" set viminfo='10,\"100,:20,%,n$VIMDATA/_viminfo_windows
" elseif has("unix")
	" set viminfo='10,\"100,:20,%,n$HOME./.vimtmp/.viminfo_linux
" endif


"======================================================================
" Remove trailing whitespace when writing a buffer, but not for diff files.
" From: Vigil
" @see http://blog.bs2.to/post/EdwardLee/17961
"======================================================================
function RemoveTrailingWhitespace()
	if &filetype == "vim"
		return
	endif

	if &ft != "diff"
		let b:curcol = col(".")
		let b:curline = line(".")
		silent! %s/\s\+$//
		silent! %s/\(\s*\n\)\+\%$//
		call cursor(b:curline, b:curcol)
	endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()


"======================================================================
" plguin - a.vim  .h/.cpp 文件切换
"======================================================================
nnoremap <silent> <F12> :A<CR>
" <Leader>ha :插入 #ifndef....
function InsertHeadDef(firstLine, lastLine)
	if a:firstLine <1 || a:lastLine> line('$')
		echoerr 'InsertHeadDef : Range overflow !(FirstLine:'.a:firstLine.';LastLine:'.a:lastLine.';ValidRange:1~'.line('$').')'
		return ''
	endif
	let sourcefilename=expand("%:t")
	let definename=substitute(sourcefilename,' ','','g')
	let definename=substitute(definename,'\.','_','g')
	let definename = toupper(definename)
	exe 'normal '.a:firstLine.'GO'
	call setline('.', '#ifndef _'.definename."_")
	normal ==o
	call setline('.', '#define _'.definename."_")
	exe 'normal =='.(a:lastLine-a:firstLine+1).'jo'
	call setline('.', '#endif	/* _'.definename."_ */")

	let goLn = a:firstLine+2
	exe 'normal =='.goLn.'G'
endfunction
function InsertHeadDefN()
	let firstLine = 1
	let lastLine = line('$')
	let n=1
	while n < 20
		let line = getline(n)
		if n==1
			if line =~ '^\/\*.*$'
				let n = n + 1
				continue
			else
				break
			endif
		endif
		if line =~ '^.*\*\/$'
			let firstLine = n+1
			break
		endif
		let n = n + 1
	endwhile
	call InsertHeadDef(firstLine, lastLine)
endfunction
nmap ,ha :call InsertHeadDefN()<CR>


"======================================================================
" 删除一个缓冲区文件时,不关闭窗口
"======================================================================
function! <SID>BufcloseCloseIt()
	let l:currentBufNum = bufnr("%")
	let l:alternateBufNum = bufnr("#")

	if buflisted(l:alternateBufNum)
		buffer #
	else
		bnext
	endif

	if bufnr("%") == l:currentBufNum
		new
	endif

	if buflisted(l:currentBufNum)
		execute("bdelete! ".l:currentBufNum)
	endif
endfunction


"======================================================================
" plugin -- gist
"======================================================================
let g:gist_clip_command = 'xclip -selection clipboard'


"======================================================================
" plugin - TabHighlight
"======================================================================
if ! exists('g:TagHighlightSettings')
		let g:TagHighlightSettings = {}
endif
let g:TagHighlightSettings['ForcedPythonVariant'] = 'if_pyth'
let g:TagHighlightSettings['CtagsExecutable'] = 'ctags'



nmap cn :cn<cr>
nmap cp :cp<cr>
nmap <Leader>cw :cw 4<cr>


"======================================================================
" Uncomment the following to have Vim jump to the last position when reopening a file
"======================================================================
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
if v:version > 703
	set undofile
	set undolevels=100
	set undodir=~/.vimtmp/undodir
	
	" set writebackup
	" set backup
	" set backupdir=~/.vimtmp/backup,.		" Set backup directory
	" set directory=~/.vimtmp/backup,.		" Set backup directory
	" autocmd BufWritePre * let &backupext = strftime(".%m-%d--%H-%M")
endif
" set viewdir=~/.vimtmp/view
" autocmd BufWinLeave * if expand('%') != '' && &buftype == '' | mkview | endif
" autocmd BufRead     * if expand('%') != '' && &buftype == '' | silent loadview | syntax on | endif

" function! RemoveOldViewFiles()
	" exe 'find '.$VIMFILES.'/view* -mtime +90 -exec rm {} \;'
" endfunction
" nmap <leader>.cl :call RemoveOldViewFiles()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatically give executable permissions if file begins with #! and contains '/bin/' in the path
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent execute "!chmod a+x <afile>" | endif | endif


" set color of  current Column:
function! SetColorColumn()
	let col_num = virtcol(".")
	let cc_list = split(&cc, ',')
	if count(cc_list, string(col_num)) <= 0
		execute "set cc+=".col_num
	else
		execute "set cc-=".col_num
	endif
endfunction
map ,cur :call SetColorColumn()<CR>

"##### auto fcitx  ###########
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

" let s:first_input = 1
" function! Fcitx2zh()
	" let s:input_status = system("fcitx-remote")
	" if s:input_status != 2 && g:input_toggle == 1
				" \&& s:first_input == 0
		" let l:a = system("fcitx-remote -o")
		" let g:input_toggle = 0
	" else
		" let s:first_input = 0
	" endif
" endfunction

set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
"进入插入模式
" autocmd InsertEnter * call Fcitx2zh()
"##### auto fcitx end ######

" let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
" let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'

colorscheme molokai


" Alt+数字切换Table快捷键设置
function! TabPos_ActivateBuffer(num)
	let s:count = a:num
	exe "tabfirst"
	exe "tabnext" s:count
endfunction

function! TabPos_Initialize()  
	for i in range(1, 9)
		exe "map <M-" . i . "> :call TabPos_ActivateBuffer(" . i . ")<CR>"
	endfor
	exe "map <M-0> :call TabPos_ActivateBuffer(10)<CR>"
endfunction

autocmd VimEnter * call TabPos_Initialize() 

nn <M-1> 1gt
nn <M-2> 2gt
nn <M-3> 3gt
nn <M-4> 4gt
nn <M-5> 5gt
nn <M-6> 6gt
nn <M-7> 7gt
nn <M-8> 8gt
nn <M-9> 9gt
nn <M-0> :tablast<CR> 



"显示标签页的序号
set tabline=%!MyTabLine()  " custom tab pages line
function MyTabLine()
	let s = '' " complete tabline goes here
	" loop through each tab page
	for t in range(tabpagenr('$'))
		" set highlight
		if t + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif
		" set the tab page number (for mouse clicks)
		let s .= '%' . (t + 1) . 'T'
		let s .= ' '
		" set page number string
		let s .= t + 1 . ' '
		" get buffer names and statuses
		let n = ''      "temp string for buffer names while we loop and check buftype
		let m = 0       " &modified counter
		let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
		" loop through each buffer in a tab
		for b in tabpagebuflist(t + 1)
			" buffer types: quickfix gets a [Q], help gets [H]{base fname}
			" others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
			if getbufvar( b, "&buftype" ) == 'help'
				let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
			elseif getbufvar( b, "&buftype" ) == 'quickfix'
				let n .= '[Q]'
			else
				let n .= pathshorten(bufname(b))
			endif
			" check and ++ tab's &modified count
			if getbufvar( b, "&modified" )
				let m += 1
			endif
			" no final ' ' added...formatting looks better done later
			if bc > 1
				let n .= ' '
			endif
			let bc -= 1
		endfor
		" add modified label [n+] where n pages in tab are modified
		if m > 0
			let s .= '[' . m . '+]'
		endif
		" select the highlighting for the buffer names
		" my default highlighting only underlines the active tab
		" buffer names.
		if t + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif
		" add buffer names
		if n == ''
			let s.= '[New]'
		else
			let s .= n
		endif
		" switch to no underlining and add final space to buffer list
		let s .= ' '
	endfor
	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%#TabLineFill#%T'
	" right-align the label to close the current tab page
	if tabpagenr('$') > 1
		let s .= '%=%#TabLineFill#�9Xclose'
	endif
	return s
endfunction 
