""set options 
scriptencoding utf-8
colorscheme pablo 
filetype plugin indent on    " required
syntax on
set encoding=utf-8
set guifont=Consolas\ New:h11
set autoread
set hidden
set nocompatible              " be iMproved, required
set number
set mouse=a
set showmatch
set mat=3
set laststatus=2
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set foldmethod=indent
set foldlevel=99
set completeopt=longest,menuone
set ts=4
set sw=4
set ic
set si
set scs
set wrap
set linebreak
set expandtab
set ff=unix
set nobackup
set noswapfile
set nowb
set incsearch
set hlsearch
set backspace=indent,eol,start
set rtp+=~/.vim/bundle/Vundle.vim
set cursorline
hi clear CursorLine
hi CursorLine term=bold ctermbg=236 guibg=grey40
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""PLUGINS
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'vimwiki/vimwiki'
Plugin 'bps/vim-tshark'
call vundle#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""ENDOF PLUGINS

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""NETRW SETTINGS
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Explore scp://127.0.0.1:22000/

"augroup ENDlet 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""ENDOF NETRW SETTINGS

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""COMMAND REMAPS
nnoremap <silent> <F1> :NERDTreeToggle<CR>
nnoremap <silent><F2> :TagbarToggle<CR> <c-w>l
nnoremap <silent><F3> :bp<CR>
nnoremap <silent><F4> :bn<CR>
map      <silent><F5> :call LineNumToggle()<cr>
nnoremap <F12> :vertical resize +20<CR>
nnoremap <F11> :vertical resize -20<CR>
nnoremap <F10> : resize +10<CR>
nnoremap <F9> : resize -10<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
behave xterm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""HYBRID LINE NUMBERING
if !&diff
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
endif

""hybrid line number toggle
function! LineNumToggle()
    if &relativenumber
        set norelativenumber
    else
        set relativenumber
    endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""ENDOF HYBRID LINE NUMBERING

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""AIRLINE
let g:airline_powerline_fonts = 1
"let g:airline_symbols_ascii = 1
let g:airline_section_z = airline#section#create(["L" . '%{line(".")}' . "C" . '%{col(".")}'])
let g:Powerline_symbols = 'powerlinish'
let g:airline_theme='dark'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
"let g:airline_left_sep = '>'
let g:airline_left_alt_sep = '►'
"let g:airline_right_sep = '<'
let g:airline_right_alt_sep = ''
let g:airline_symbols.crypt = '⺎'
"let g:airline_symbols.linenr = 'Line:'
let g:airline_symbols.maxlinenr = 'Ʃ'
let g:airline_symbols.branch = '丆'
let g:airline_symbols.paste = ''
let g:airline_symbols.spell =''
let g:airline_symbols.notexists = ''
let g:airline_symbols.whitespace = '厂'
"let g:airline#extensions#tabline#left_sep = '#'
let g:airline#extensions#tabline#left_alt_sep = '►'
"let g:airline#extensions#tabline#right_sep = '*'
let g:airline#extensions#tabline#right_alt_sep = '❖'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""ENDOF AIRLINE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:sytnastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = "std=C++11 -Wall -Wextra -Wpedantic"
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':['cpp'],'passive_filetypes': [] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_cpp_checkers = ['cppcheck']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""ENDOF SYNTASTIC

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""TABLINE
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""ENDOF TABLINE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""VIMDIFF
if &diff
    syntax off
    highlight DiffAdd cterm=none ctermfg=green ctermbg=black gui=none guifg=fg guibg=Blue
    highlight DiffDelete cterm=none ctermfg=red ctermbg=black gui=none guifg=fg guibg=Blue
    highlight DiffChange cterm=none ctermfg=cyan ctermbg=black gui=none guifg=fg guibg=Blue
    highlight DiffText cterm=none ctermfg=black ctermbg=cyan gui=none guifg=bg guibg=White
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""ENDOF VIMDIFF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""BUFTABLINE
let g:buftabline_show = 1
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""ENDOF BUFTABLINE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""WHITESPACE
hi space  ctermbg=12
set listchars=eol:►,tab:○→,trail:•
set list
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""ENDOF WHITESPACE
let g:tagbar_autoclose = 1
