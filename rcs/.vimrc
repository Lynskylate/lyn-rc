let mapleader = " "
set encoding=utf-8
"解决退格键失效
set backspace=2
syntax on
"依据文本类型设置自动缩进
filetype indent plugin on
"python indent config
autocmd FileType setlocal et sta sw=4 sts=4


set ts=4
set expandtab
set autoindent
set showcmd
colorscheme inkpot_modified
set number
" set tags=./tags
" set tags+=~/.vim/systags
" set tags=tags
" set autochdir

"vim-plug
call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim', { 'for': 'rs' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'mxw/vim-jsx', { 'for': 'jsx' }
Plug 'pangloss/vim-javascript', { 'for': 'js' }
Plug 'roxma/vim-tmux-clipboard'
Plug 'vim-airline/vim-airline'
Plug 'posva/vim-vue', { 'for' : 'vue' }
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
call plug#end()

" basic config compication window color
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black


"Nerd comment
"<leader>cc comment
"<leader>cu uncomment
"<leader>c<space> smartcomment
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


nnoremap <Leader>ev :vsplit<CR>

"ctrlp config
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mod = "ra"

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
	\'dir' : '\v[\/]\.(git|hg|svn|__pycache__)$',
	\'file' : '\v\.(so|dll|exe|pyc)$',
	\}
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
let g:ctrlp_user_command = 'find %s -type f'
let g:jsx_ext_required = 0


augroup javascript_folding
	au!
	au FileType javascript setlocal foldmethod=syntax
augroup END


" airline配置
set laststatus=2
" let g:airline_theme='simple'
augroup nerdtree_settings
    autocmd!
    " NERDDTree快捷键
    map <leader>t :NERDTreeToggle<CR>
    " map <C-n> :NERDTreeToggle<CR>
    nnoremap <leader>r :NERDTreeFind<cr>
    " 显示行号
    " let NERDTreeShowLineNumbers=1
    " let NERDTreeAutoCenter=1
    " 是否显示隐藏文件
    let NERDTreeShowHidden=1
    " 设置宽度
    let NERDTreeWinSize=30
    " 在终端启动vim时，共享NERDTree
    let g:nerdtree_tabs_open_on_console_startup=1
    " 忽略一下文件的显示
    let NERDTreeIgnore=['\.pyc','\~$',
                \ '\.swp',
                \ '.DS_Store',
                \ '\.orig$',
                \ '@neomake_',
                \ '__pycache__$[[dir]]',
                \ '.git[[dir]]',
                \ '.cache[[dir]]',
                \ '.idea[[dir]]',
                \ '.vscode[[dir]]',
                \ '.egg-info$[[dir]]']
    " 显示书签列表
    let NERDTreeShowBookmarks=1
    " 改变nerdtree的箭头
    " let g:NERDTreeDirArrowExpandable = '?'
    " let g:NERDTreeDirArrowCollapsible = '?'
    " vim不指定具体文件打开是，自动使用nerdtree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree |endif
    
    " 当vim打开一个目录时，nerdtree自动使用
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    
    " 当vim中没有其他文件，值剩下nerdtree的时候，自动关闭窗口
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
augroup END
" }}}


"设置tab缩进
augroup tab_set
    autocmd!
    autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp,javascript set ai
    autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp,javascript set sw=4
    autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp,javascript set ts=4
    autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp,javascript set sts=4
    autocmd FileType coffee,html,css,xml set ai
    autocmd FileType coffee,html,css,xml set sw=2
    autocmd FileType coffee,html,css,xml set ts=2
    autocmd FileType coffee,html,css,xml set sts=2
augroup END
" }}}
"

inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突---{{{
augroup ycm_config
    " let g:ycm_key_list_select_completion=['<c-n>']
    " let g:ycm_key_list_select_completion = ['<Down>']
    " let g:ycm_key_list_previous_completion=['<c-p>']
    " let g:ycm_key_list_previous_completion = ['<Up>']
    set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
    let g:ycm_python_binary_path = 'python'
    let g:ycm_key_invoke_completion = '<c-z>'
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
    let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

    let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
    let g:ycm_min_num_of_chars_for_completion=3	" 从第2个键入字符就开始罗列匹配项
    let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
    let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
    nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
    "nnoremap <leader>lo :lopen<CR>	"open locationlist
    "nnoremap <leader>lc :lclose<CR>	"close locationlist
    " inoremap <leader><leader> <C-x><C-o>
    "在注释输入中也能补全
    let g:ycm_complete_in_comments = 1
    "在字符串输入中也能补全
    let g:ycm_complete_in_strings = 1
    "注释和字符串中的文字也会被收入补全
    let g:ycm_collect_identifiers_from_comments_and_strings = 0

    let g:ycm_semantic_triggers =  {
                \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
                \ 'cs,lua,javascript': ['re!\w{2}'],
                \ }

    nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
augroup END


"  展开收缩折叠
nnoremap <leader>z @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


" Syntastic conf
let g:syntastic_error_symbol = '✗' "set error or warning signs
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['yapf', 'pylint']
"highlight SyntasticErrorSign guifg=white guibg=black

let g:syntastic_cpp_include_dirs = ['/usr/include/', './include', './src']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_cpplint_exec='cpplint'
let g:syntastic_cpp_checkers=['cpplint']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1 "whether to show balloons


function HeaderPython()
    call setline(1,"#!/usr/bin/env python")
    call append(1,"#-*- encoding:utf-8")
    call append(2,'"""')
    call append(3,'Author:Lynskylate')
    call append(4,'project:')
    call append(5,'Description:')
    call append(6,'Licence:BSD')
    call append(7,'"""')
    normal G
    normal o
    normal o
endf

autocmd bufnewfile *.py call HeaderPython()

function HeaderHtml()
    call setline(1,'<!DOCTYPE html>')
    call append(1,'<html>')
    call append(2,'<head></head>')
    call append(3,'<body>')
    call append(4,'</body>')
    call append(5,'</html>')
    normal G
    normal o
endf
autocmd bufnewfile *.html call HeaderHtml()
