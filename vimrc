set nocompatible
filetype off

set rtp+=/usr/local/opt/fzf
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

"let mapleader = ","
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

"Plugin 'gmarik/Vundle.vim'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'tomasr/molokai'
"Plugin 'scrooloose/nerdtree'
"Plugin 'c9s/colorselector.vim'
"Plugin 'ap/vim-css-color'
"Plugin 'kien/ctrlp.vim'
"Plugin 'mhinz/vim-tmuxify'
"Plugin 'beyondwords/vim-twig'
"Plugin 'vim-scripts/symfony.vim'
"Plugin 'obsidian2.vim'
"Plugin 'peaksea'
""Plugin 'dhruvasagar/vim-table-mode'
""Plugin 'Valloric/YouCompleteMe'
""Plugin 'cespare/vim-golang'
""Plugin 'Blackrush/vim-gocode'
"Plugin 'fatih/vim-go'
""Plugin 'scrooloose/syntastic'
""Plugin 'SirVer/ultisnips'
""Plugin 'honza/vim-snippets'
""Plugin 'othree/xml.vim'
""Plugin 'vimviki/vimwiki'
""Plugin 'rizzatti/dash.vim'
""Plugin 'https://github.com/neilagabriel/vim-geeknote'
"
"
"call vundle#end()
filetype plugin indent on 

"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"let g:syntastic_ignore_files=[".*\.go$"]
set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set shortmess=atI

set backspace=2
set clipboard=unnamed

inoremap <caps-lock> ,n
imap <S-Enter> <ESC>
set cindent
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
set ruler
if &term=="xterm"
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif

:set ts=4
:set expandtab


syntax on
syntax enable
filetype on
filetype plugin on
"filetype plugin indent on

"colo clarity
set background=dark

if has('gui_running')
    colorscheme molokai
elseif has('mac')
    colorscheme molokai
else
    colo freya
endif


set guioptions-=m
set guioptions-=T
set showtabline=1
set nobackup
set ignorecase
set hlsearch
set incsearch
set helplang=cn

set scrolloff=5
set showcmd
set whichwrap=b,s,<,>,[,]
set wrap
set cmdheight=1
set laststatus=2
set statusline=%F%m%r,%Y,%{&fileformat}\ \ \ ASCII=\%b,HEX=\%B\ \ \ %l,%c%V\ %p%%\ \ \ [\ %L\ lines\ in\ all\ ]


if has('gui_running')
    " 只显示菜单
    set guioptions=mcr

    " 高亮光标所在的行
    set cursorline

    " 编辑器配色
    "colorscheme zenburn
    "colorscheme dusk

    if has("win32")
        " Windows 兼容配置
        source $VIMRUNTIME/mswin.vim

        " f11 最大化
        map <f11> :call libcallnr('fullscreen.dll', 'ToggleFullScreen', 0)<cr>

        set winaltkeys=no
        au GUIEnter * simalt ~x
        " 字体配置
        exec 'set guifont='.iconv('Courier_New', &enc, 'gbk').':h11:cANSI'
        exec 'set guifontwide='.iconv('微软雅黑', &enc, 'gbk').':h11'
    endif

    if has("unix") && !has('gui_macvim')
        "set guifont=Courier\ 10\ Pitch\ 9
        set guifont=Monaco\ 8
        set guifontwide=YaHei\ Consolas\ Hybrid\ 8
        "function Maximize_Window()
        "    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
        "endfunction
    endif
    if has("mac") || has("gui_macvim")
        "set guifont=Courier\ New:h18.00
        "set guifontwide=YaHei\ Consolas\ Hybrid:h16.00
        set guifont=Monaco:h10
"        set guifont=Droid\ Sans\ Mono:h14
"        set guifontwide=YouYuan:h14
        if has("gui_macvim")
            "set transparency=4
            set lines=200 columns=300

            let s:lines=&lines
            let s:columns=&columns
            func! FullScreenEnter()
                set lines=999 columns=999
                set fu
            endf

            func! FullScreenLeave()
                let &lines=s:lines
                let &columns=s:columns
                set nofu
            endf

            func! FullScreenToggle()
                if &fullscreen
                    call FullScreenLeave()
                else
                    call FullScreenEnter()
                endif
            endf
        endif
    endif
else
    set t_Co=256
    "color delek
endif

"set fdm=indent
set fdm=manual

map ,w :w<cr>
map ,qq :q<cr>
map ,t :NERDTreeToggle<cr>
map ,l :ls<cr>

imap <c-j> <down>
imap <c-k> <up>
imap <c-b> <left>
imap <c-f> <right>

set mouse=a
set hidden

set directory=~/tmp,/tmp

let twitvim_count = 50

let g:neocomplcache_enable_at_startup = 1


" Persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.beam
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let Tlist_Use_Right_Window=1

let $GOPATH = "/Users/guzhengxiao/dev/go/"

set wildignore+=*/node_modules/*,*/vendor,*/templates_cache
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules|vendor|\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|zip)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
