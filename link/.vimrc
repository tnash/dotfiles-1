source $HOME/.vim/config/plugins.vimrc

" Change mapleader
let mapleader=","

" Now ; works just like : but with 866% less keypresses!
nnoremap ; :

" Move more naturally up/down when wrapping is enabled.
nnoremap j gj
nnoremap k gk

nnoremap <leader>w :<C-u>Kwbd<cr>

" Copy to OS clipboard
set clipboard=unnamed
set pastetoggle=<F10>

" Local dirs
set backupdir=$DOTFILES/caches/vim
set directory=$DOTFILES/caches/vim
set undodir=$DOTFILES/caches/vim
let g:netrw_home = expand('$DOTFILES/caches/vim')

" --- BEGIN custom syntax and color highlighting ---
" Ref: https://github.com/sentientmachine/erics_vim_syntax_and_color_highlighting
syntax on
set background=dark
set hlsearch
set nu

set cursorline
filetype on
filetype plugin indent on

au BufReadPost,BufNewFile *.twig colorscheme koehler 
au BufReadPost,BufNewFile *.css colorscheme slate
au BufReadPost,BufNewFile *.js colorscheme slate2
au BufReadPost,BufNewFile *.py colorscheme molokaiyo
au BufReadPost,BufNewFile *.html colorscheme monokai
au BufReadPost,BufNewFile *.java colorscheme monokai
" au BufReadPost,BufNewFile *.php colorscheme monokai

" Default line highlighting for unknown filetypes
hi String ctermfg=140
hi CursorLine ctermbg=235
hi CursorLine guibg=#D3D3D3 cterm=none

"What follows are optional things, I like them

"au BufNewFile,BufRead *.py 
"        \ set tabstop=4 
"        \ set shiftwidth=4     "aand fedora doesn't like this parameter, remove this line.
"        \ set textwidth=79 
"        \ set expandtab 
"        \ set autoindent 
"        \ set fileformat=unix

" Commenting blocks of code.
" This specifies the comment character when specifying block comments.
"autocmd FileType c,cpp,java,scala let b:comment_leader = '//'
"autocmd FileType sh,ruby,python   let b:comment_leader = '#'
"autocmd FileType conf,fstab       let b:comment_leader = '#'
"autocmd FileType tex              let b:comment_leader = '%'
"autocmd FileType mail             let b:comment_leader = '>'
"autocmd FileType vim              let b:comment_leader = '"'

"this makes it so you can Shift-V highlight lots of text then press ,cc to
"comment it or ,cu to uncomment.  
"noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
"noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

"This mission critical workaround hack tells vim to restore cursor to the last line.
"Be sure to set: "Thip, crinkle, sploit" to "stopit, just be right".  lolz
"Also it could be the functionality is disabled in your /etc/vim/vimrc or 
"your ~/.viminfo is owned by root.  
"http://askubuntu.com/questions/223018/vim-is-not-remembering-last-position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

"These extra commands tell syntastic to ignore the following kinds of warnings                                                               
"let g:syntastic_quiet_messages = { "regex": 'superfluous' }
"let g:syntastic_quiet_messages = { "regex": 'superfluous-parens\|too-many-instance-attributes\|too-few-public-methods' }

"I like the vertical bar on insert mode, others do not like.  You decide.
"let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
"let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode

" --- END custom syntax and color highlighting ---
"
" Visual settings
set cursorline " Highlight current line
set number " Enable line numbers.
set showtabline=2 " Always show tab bar.
set relativenumber " Use relative line numbers. Current line is still in status bar.
set title " Show the filename in the window titlebar.
set nowrap " Do not wrap lines.
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set laststatus=2 " Always show status line

" Toggle between absolute and relative line numbers
augroup relative_numbers
  autocmd!
  " Show absolute numbers in insert mode
  autocmd InsertEnter * :set norelativenumber
  autocmd InsertLeave * :set relativenumber
augroup END

" Make it obvious where 80 characters is
" set textwidth=80
" set colorcolumn=+1

" Scrolling
set scrolloff=3 " Start scrolling three lines before horizontal border of window.
set sidescrolloff=3 " Start scrolling three columns before vertical border of window.

" Indentation
set autoindent " Copy indent from last line when starting new line.
set shiftwidth=2 " The # of spaces for indenting.
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set softtabstop=4 " Tab key results in 2 spaces
set tabstop=4 " Tabs indent only 2 spaces
set shiftwidth=4
set expandtab " Expand tabs to spaces

" Reformatting
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command.

" Toggle show tabs and trailing spaces (,c)
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:>,precedes:<
"set listchars=tab:>\ ,trail:.,eol:$,nbsp:_,extends:>,precedes:<
"set fillchars=fold:-
nnoremap <silent> <leader>v :call ToggleInvisibles()<CR>

" Extra whitespace
augroup highlight_extra_whitespace
  autocmd!
  autocmd BufWinEnter * :2match ExtraWhitespaceMatch /\s\+$/
  autocmd InsertEnter * :2match ExtraWhitespaceMatch /\s\+\%#\@<!$/
  autocmd InsertLeave * :2match ExtraWhitespaceMatch /\s\+$/
augroup END

" Toggle Invisibles / Show extra whitespace
function! ToggleInvisibles()
  set nolist!
  if &list
    hi! link ExtraWhitespaceMatch ExtraWhitespace
  else
    hi! link ExtraWhitespaceMatch NONE
  endif
endfunction

set nolist
call ToggleInvisibles()

" Trim extra whitespace
function! StripExtraWhiteSpace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction
noremap <leader>ss :call StripExtraWhiteSpace()<CR>

" Search / replace
set gdefault " By default add g flag to search/replace. Add g to toggle.
set hlsearch " Highlight searches
set incsearch " Highlight dynamically as pattern is typed.
set ignorecase " Ignore case of searches.
set smartcase " Ignore 'ignorecase' if search pattern contains uppercase characters.

" Clear last search
map <silent> <leader>/ <Esc>:nohlsearch<CR>

" Ignore things
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/log/*,*/tmp/*

" Vim commands
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set report=0 " Show all changes.
set mouse=a " Enable mouse in all modes.
set shortmess+=I " Hide intro menu.

" Splits
set splitbelow " New split goes below
set splitright " New split goes right

" Ctrl-J/K/L/H select split
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Buffer navigation
nnoremap <leader>b :CtrlPBuffer<CR> " List other buffers
map <leader><leader> :b#<CR> " Switch between the last two files
map gb :bnext<CR> " Next buffer
map gB :bprev<CR> " Prev buffer

" Jump to buffer number 1-9 with ,<N> or 1-99 with <N>gb
let c = 1
while c <= 99
  if c < 10
    execute "nnoremap <silent> <leader>" . c . " :" . c . "b<CR>"
  endif
  execute "nnoremap <silent> " . c . "gb :" . c . "b<CR>"
  let c += 1
endwhile

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

" Use Q for formatting the current paragraph (or selection)
" vmap Q gq
" nmap Q gqap

" When editing a file, always jump to the last known cursor position. Don't do
" it for commit messages, when the position is invalid, or when inside an event
" handler (happens when dropping a file on gvim).
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" F12: Source .vimrc & .gvimrc files
nmap <F12> :call SourceConfigs()<CR>

if !exists("*SourceConfigs")
  function! SourceConfigs()
    let files = ".vimrc"
    source $MYVIMRC
    if has("gui_running")
      let files .= ", .gvimrc"
      source $MYGVIMRC
    endif
    echom "Sourced " . files
  endfunction
endif

"" FILE TYPES
augroup file_types
  autocmd!

  " vim
  autocmd BufRead .vimrc,*.vim set keywordprg=:help

augroup END


