" Plugins
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'akhaku/vim-java-unused-imports'
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-multiple-cursors'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'mhinz/vim-signify'
Plug 'honza/vim-snippets'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'Valloric/YouCompleteMe'
call plug#end()

" Airline
let g:airline_powerline_fonts = 1 " TODO: detect this?
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#fnamecollapse = 0
"let g:airline#extensions#tabline#fnamemod = ':t'

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeMouseMode = 2
let NERDTreeMinimalUI = 1
let g:nerdtree_tabs_open_on_console_startup=1
map <leader>n :NERDTreeToggle<CR>

" Signify
let g:signify_vcs_list = ['git', 'hg', 'svn']

" CtrlP.vim
map <leader>p <C-P>
map <leader>r :CtrlPMRUFiles<CR>
"let g:ctrlp_match_window_bottom = 0 " Show at top of window
set wildignore+=*/build/**
set wildignore+=*/target/**

" Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" SuperTab
let g:SuperTabCrMapping=1
let g:SuperTabDefaultCompletionType = '<C-n>'

" YouCompleteMe
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" indentLine
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

" Debug command for Spring Boot projects
if !exists(":Debug")
    autocmd BufRead *.java command! Debug bd | ! mvn clean package -DskipTests && mvim --servername mvim && java -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=1044,suspend=n -jar ./target/*-null.war
endif

" Eclim Debugger Shortcuts
command JDBS JavaDebugStart localhost 1044
command JDBT JavaDebugBreakpointToggle
command JDBL JavaDebugBreakpointsList

" Fix mvim+eclim refresh issue
command -bar -nargs=1 -buffer JDBStep :call eclim#java#debug#Step(<f-args>)
command JDBSO :call eclim#java#debug#Step("over") | JavaDebugStatus
command JDBSI :call eclim#java#debug#Step("into") | JavaDebugStatus
command JDBSR :call eclim#java#debug#Step("return") | JavaDebugStatus

source ~/.vim/regexlist.vim
