" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vundle setup
set nocompatible	" be iMproved, required
filetype off		" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()

  " general plugins
  Plugin 'scrooloose/nerdtree'            " file navigation
  Plugin 'Chiel92/vim-autoformat'         " autoformatter
  Plugin 'Lokaltog/vim-easymotion'        " jump around screen quickly (use leader leader w)
  Plugin 'Tagbar'                         " displays source code tags (use f8 - see remappings in this file)
  Plugin 'tpope/vim-fugitive'             " Git wrapper
  Plugin 'kien/ctrlp.vim'                 " fuzzy file,buffer,etc. finder (use ctrl-p - see remappins in this file)
  Plugin 'nathanaelkane/vim-indent-guides'" Visualising indent guides

  " language specific plugins
  Plugin 'hallison/vim-markdown'          " syntax highlighting for Markdown
  Plugin 'moll/vim-node'                  " tools for making vim superb for node.js development
  Plugin 'pangloss/vim-javascript'        " syntax highligting and indentation for js
  Plugin 'digitaltoad/vim-jade'           " syntax highlighting for jade
  Plugin 'groenewege/vim-less'            " syntax highlighting for less


  " 3rd Pary Themes
  Plugin 'morhetz/gruvbox'
  Plugin 'w0ng/vim-hybrid'
  Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
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

" General settings
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental searchnnoremap <Space> <Nop>
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set number              " set line numbering to be on
set colorcolumn=+1      " add a vertical column
" Indentation
set expandtab
set shiftwidth=2
set softtabstop=2

" Custom Mappings
map <C-n> :NERDTreeToggle<CR>
let mapleader=" "
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <Space> <Nop>
nnoremap <silent> <F8> :TagbarToggle<CR> " for tag list

" Vim will jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif


" Source a global configuration file if available
" if filereadable("/etc/vim/vimrc.local")
"   source /etc/vim/vimrc.local
" endif

" set spelling
if has("spell")
    set spelllang=en_gb
    nnoremap <leader>s :set spell!<CR>
endif


" Autoformat plugin
noremap <F3> :Autoformat<CR><CR>

" set colorscheme
if has('gui_running')
  syntax enable
  set background=dark
  colorscheme solarized
else
    " Non-GUI (terminal) colors
  colorscheme delek
endif
