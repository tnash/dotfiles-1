call plug#begin('~/.vim/plugged')
Plug 'skwp/vim-colors-solarized'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
call plug#end()

let mapleader=','


"""""""""""
" Plugins "
"""""""""""

" vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized

" lightline
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" nercommenter
filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" fzf
nmap <leader>t :FZF<CR>
nmap <leader>b :Buffers<CR>

" vim-gitgutter
nmap <leader>g :GitGutterToggle<CR>



"""""""""""
" General "
"""""""""""

nnoremap ; :
set clipboard=unnamed   " use system clipboard
set directory-=.        " don't store swapfiles in current directory
set nocompatible        " no vi compatibility
set number              " show line numbers
set relativenumber      " relative line numbers
set mouse=a             " enable mouse use in all modes
set ttymouse=xterm2     " set mouse codes for iterm2
set textwidth=80        " limit text to 80 chars
set colorcolumn=+1      " highlight textwidth column
highlight ColorColumn ctermbg=236   " Highlight color
set expandtab           " expand tabs to spaces
set shiftwidth=2        " the # of spaces for indenting
set tabstop=2           " tabs indent only 2 spaces
set softtabstop=2       " tab key results in 2 spaces
set list                " show trailing whitespace
set listchars=tab:▸\ ,trail:· " set tab and trailing space charcters
set scrolloff=4         " scroll three lines before horizontal border of window
set showcmd             " show command in the last line of the screen
set ignorecase          " ignore case in a pattern
set smartcase           " case-sensitive if pattern starts with cap character
set hlsearch            " highlight search matches
set hidden              " allow buffers to be hidden and not abandoned
set splitbelow          " new split goes below
set splitright          " new split goes right
let g:netrw_banner=0    " remove banner
let g:netrw_liststyle=3 " tree view

" Easier splits
nnoremap <C-\> :vsp<CR>
nnoremap <C-_> :sp<CR>

" More natural split navigation
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

nnoremap <leader>w :q<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>n :nohlsearch<CR>
nnoremap <leader>e :Explore<CR>

" ctags
nnoremap <leader>m :!ctags -R .<CR>

" pretty json
nnoremap <leader>p :%!python -m json.tool<CR>

" Trim trailing whitespace with <leader><space>
function! Strip_trailing()
  let previous_search=@/
  let previous_cursor_line=line('.')
  let previous_cursor_column=col('.')
  %s/\s\+$//e
  let @/=previous_search
  call cursor(previous_cursor_line, previous_cursor_column)
endfunction
nmap <leader><space> :call Strip_trailing()<CR>

