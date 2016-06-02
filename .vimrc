"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"显示相关
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"显示行号
set nu
"语法高亮
syntax on
"输入的命令看的明白些
set showcmd
"去掉vi的一些讨厌的模式
set nocompatible
"显示中文帮助
if version>=603
	set helplang=cn
	set encoding=utf-8
endif
"设置编码
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"设置字符
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

"
colorscheme ron

"设置语言
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F4> ms:call TitleDet()<cr>
function AddTitle()
		call setline(1,"\###################################################################")
		call append(line("."),"\# File Name:".expand("%"))
		call append(line(".")+1,"\# Author:YFzhang")
		call append(line(".")+2,"\# mail:hnnyzyf2013@163.com")
		call append(line(".")+3,"\# Created Time:".strftime("%c"))
		call append(line(".")+4,"\# Last Modified".strftime("%c"))
		call append(line(".")+5,"\####################################################################")
endfunction


function UpdateTitle()
	"更新
	"execute '/# *Last Modified:/s@\=strftime(":\t%c")@'
	call setline(6,"\# Last Modified:".strftime("%c"))
	normal ''
	normal mk
	"execute '/# *File Name:/s@:.*$@\=":\t\t".expand("%d:t")@'
	execute setline(2,"\# File name:".expand("%"))
	execute "noh"
	normal 'k
	echohl WarningMsg|echo "Successful"|echohl None
endfunction

function TitleDet()
	let n=1
	while n<10
		let line=getline(n)
		if line =~'^\#\s*\S*Last\S*.*$'
			call UpdateTitle()
			return
		endif
		let n=n+1
	endwhile
	call AddTitle()
endfunction
	

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
"映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
"选中状态下ctrl+c复制
vmap <C-c> "+y
"去空行
nnoremap <F2> :g/^\s*$/d<CR>
"列出当前目录
map <F3> :tabnew .<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"使用功能
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"当文件被改动自动载入
set autoread
"代码补全
"et completeopt=preview,meum
"弹出确认
set confirm
"自动缩进
set autoindent
set cindent
"tab键的宽度
set tabstop=4
"统一缩进为4
set softtabstop=4
set shiftwidth=4
"历史计数
set history=1000
"带有如下字符不要被换行分割
set iskeyword+=_,$,&,@,#,-
"字符间插入的像素行数目
set linespace=0
"允许跨越行边界
set backspace=2
"可以使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key
"使用command命令
set report=0
"高亮显示匹配的括号
set showmatch
set matchtime=1
"c程序自动缩进
set smartindent
