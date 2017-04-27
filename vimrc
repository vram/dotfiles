set nocompatible                                 " turn off compatibility with older Vi

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'eshion/vim-sync'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-manager'



" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ

syntax enable                                    " Enabling the syntax automode depending on filetype
set number                                       " Enabling line numbers
set path+=**                                     " Enabling recursive search where I'm standing
set wildmenu                                     " I don't know what's this option for
command! MakeTags !ctags -R --fields=+laimS --languages=php
set incsearch                                    " Incremental search
set ignorecase                                   " Ignore case when searching
set smartcase                                    " Except when using a Capital letter
set showcmd                                      " Let me see what I'm typing
set autoread                                     " Autoread any external change made to the file
set showmatch                                    " show matching bracets when text indicator is over them
set tabstop=2                                    " insert 2 spaces whenever the tab key is pressed
set shiftwidth=2                                 " set indentation to 2 spaces
set autoindent                                   " start new line at the same indentation level
set nobackup                                     " do not keep backup files, it's 70's style cluttering
set noswapfile                                   " do not write annoying intermediate swap files
set wrap!                                        " turn off word wrapping
set hlsearch                                     " highlight search terms
set relativenumber															 " relative numbers from the current line
set laststatus=2
" set statusline=%f\ -\ FileType:\ %y
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1

" setting up the colorscheme
colorscheme monokai

" setting timeout lengths
set timeoutlen=1000
set ttimeoutlen=50

" stop annoying sound on errors
set noerrorbells
set novisualbell

" ignoring some extensions from being indexed on the fuzzy-search
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 

" setting up exclusions for ctrlp fuzzy-search
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


" enable 256 color mode
set t_Co=256

" turn on utf-8 file encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" changing leader key to comma
let mapleader = ","

" create horizontal & vertical splits
noremap <leader>h :sp<cr>
noremap <leader>v :vsp<cr>

" to open NerdTree
map <C-n> :NERDTreeToggle<CR>

" mappings for the snippets
set runtimepath+=~/.vim/vim-addons/vim-addon-manager
call vam#ActivateAddons([])
ActivateAddons vim-snippets ultisnips
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" highlight json as js
autocmd BufNewFile,BufRead *.json set ft=javascript

" deploy changes in dev after saving
" autocmd BufWritePost * :silent call SyncUploadFile()

" read whatever change the file might have in dev that is not in git just yet
" autocmd BufReadPre * :call SyncDownloadFile()

filetype plugin indent on
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS

