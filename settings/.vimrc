" NEW SETUP BEGIN
" gnome-terminal font: inconsolas for powerline medium size 15
" mkdir -p ~/.vim/bundle && mkdir -p ~/.tmp && mkdir -p ~/Dropbox/notes
" mkdir -p ~/.vim/UltiSnips
" 
" sudo apt install build-essential libssl-dev libffi-dev python-dev
" sudo apt install cmake python-dev3
" sudo apt install ruby ruby-dev libncurses5-dev mercurial build-essential rake
" 
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" cd ~/.vim/bundle/command-t
" rake make
"
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py --clang-completer
"
" vim .vim/bundle/jellybeans.vim/colors/jellybeans.vim
" 	change line 80: let s:background_color = "000000" (black)
"
" NEW SETUP END
" 
" be iMproved, required
set nocompatible  

" required
filetype off      

" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

				" core plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'wincent/command-t'
Bundle 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

				" main plugins
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'python-mode/python-mode'

" allow ultisnips YCM and supertab integration
Bundle 'ervandew/supertab'
Bundle 'Valloric/YouCompleteMe'

" rarely used
Plugin 'scrooloose/nerdtree'

" plugins above this line
" required
call vundle#end()            

			      " Plugin settings

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" mkdir -p ~/.vim/UltiSnips
let g:UltiSnipsSnippetDirectories=['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsEditSplit="vertical"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" let g:airline_theme='powerlineish'
let g:airline_theme='bubblegum'

let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none'},
\}

" vim-airline 
let g:airline_powerline_fonts = 1

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:.

" command-t max files to search
let g:CommandTMaxFiles=200000

			     " file specific here 

" YMAL indentation 
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" add key mappings here

" By default, vim thinks .md is Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Without this, vim breaks in the middle of words when wrapping
autocmd FileType markdown setlocal nolist wrap lbr

" encryption use :X to set encryption key :set key= , to reset"
set cm=blowfish2

" set autoindent
"set ai
" set smart indent, useful for coding
"set si

" tell vim what background you have for proper syntax highlighting
" set bg=light
" set bg=dark

" change C-a and C-x behavior to use decimal and ignore octal
" additon and subtraction

set nrformats-=octal

runtime macros/matchit.vim

" required
filetype plugin indent on  

" IndentLine enabled by default
let g:indentLine_enabled = 1

" colorscheme
colorscheme jellybeans

" ignore this in searches
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.jpg,*.png,*.gif
set wildignore+=*.swp,*.mp4,*.mp3,*.avi
set wildignore+=tmp/**

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow

" better copy & paste
set pastetoggle=<F2>

			       " core settings

" dont clutter my dirs with tmp and swp files | mkdir -p ~/.tmp
set directory=~/.tmp
set backupdir=~/.tmp
set clipboard=unnamed
" refresh file automatically
set autoread
" allow switching buffers with out saving first
set hidden
" set incremental search, highlights you are searching
set incsearch
set shiftwidth=4
" set expandtab
set number
" set relativenumber
set laststatus=2
" set gutter background to black
highlight SignColumn ctermbg=black
syntax on
set viminfo+=!
set autoindent
" set smarttab
set noesckeys
set ttimeout
set ttimeoutlen=1
" add black line to mark 80/column
" set colorcolumn=80
" highlight ColorColumn ctermbg=235
set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.
set nofoldenable " Say no to code folding...
" default register size bump"
set viminfo='20,<1000,s1000
set t_Co=256
" show incomplete commands as they are typed, e.x. 2yy
set showcmd
" Display extra whitespace
" set list listchars=tab:»·,trail:·

			     " Key mappings here
imap jk <ESC>
nmap k gk
nmap j gj

" nerdtree
map <C-\> :NERDTreeToggle<CR>

" python - F9 to execute python script
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" Quickfix management
map <Space><Space> :ccl<cr>

" disable this keys
map K <Nop>

			      " leader mappings 

let mapleader = ","
map <Leader>gw :!git add . && git commit -m 'updating stuff' && git push<cr>
map <Leader>gs :!git status<cr>
map <Leader>ws :silent w !sudo tee % > /dev/null<cr>
map <Leader>bp :!bpython -i %<cr>
map <Leader>sh :sh 
map <Leader>dr :e ~/Dropbox<cr>
map <Leader>an :e ~/Dropbox/notes/ansible-notes.md<cr>
map <Leader>pn :e ~/Dropbox/notes/personal-notes.md<cr>
map <Leader>wn :e ~/Dropbox/notes/work-notes.md<cr>
map <Leader>sn :e ~/Dropbox/notes/speed-notes.md<cr>
map <Leader>cn :e ~/Dropbox/notes/current-project-notes.md<cr>
map <F7> mzgg=G`z
