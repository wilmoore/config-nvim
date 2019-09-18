" -------
" Leader
" -------
" use <Space> as leader (thanks: http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity).
" NOTE: YOU MUST map 'caps lock' to 'control' for this to be useful, otherwise it is quite painful.
let mapleader = "\<Space>"

" -------
" Leader
" brew install fzf
" -------
" use fzf in Vim
set rtp+=/usr/local/opt/fzf

" -------
" Terminal GUI Colors
" -------
set termguicolors

" -------
" Depict Whitespace Visually
" http://vimcasts.org/episodes/show-invisibles/
" -------
set listchars=tab:▸\ ,eol:¬,trail:·,extends:\#,nbsp:.

" -------
" Buffers & Tabs
" -------
" Specify the behavior when switching between buffers
" http://stackoverflow.com/a/6853779/128346
set switchbuf=useopen

" When to show tab line
set stal=2

" Maximum number of tabs to display
set tabpagemax=50

" -------
" Increment/Decrement
" -------
" support + for increment (instead of only <c-a>)
map + <c-a>

" support = for increment (+ is ok but you need to hit <shift> to get to it)
map = <c-a>

" support - for decrement (instead of only <c-x>)
map - <c-x>

" -------
" Buffer/Tab Navigation & Management
" -------
" press <leader>w to close current buffer 
nnoremap <leader>w :bp <BAR> bd #<CR>

" Move to the previous buffer
nnoremap <C-h> :bprevious<CR>

" Move to the next buffer
nnoremap <C-l> :bnext<CR>

" -------
" Begin Plugin Installation
" -------
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" -------
" Sane defaults
" -------
Plug 'https://github.com/tpope/vim-sensible'
Plug 'https://github.com/editorconfig/editorconfig-vim'

set tabstop=4
set shiftwidth=0
set expandtab

" -------
" Easy Motion
" -------
Plug 'https://github.com/easymotion/vim-easymotion'
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Custom key mappings
map <leader>/ <Plug>(easymotion-bd-w)

" -------
" Surround
" -------
" replaces custom surround keybindings (i.e. saiw` turns foo into `foo`)
Plug 'machakann/vim-sandwich'

" -------
" Sort
" -------
" https://github.com/christoomey/vim-sort-motion (gs{motion})
Plug 'https://github.com/christoomey/vim-sort-motion'
" applies to linewise and visual sorting; not comma separated lists.
let g:sort_motion_flags = 'ui' " sort options: case insensitive, remove duplicates
" https://github.com/renke/import-sort
Plug 'https://github.com/ruanyl/vim-sort-imports'

" -------
" TComment
" -------
Plug 'https://github.com/tomtom/tcomment_vim'
" press // to comment current line and/or visually selected line(s).
map // :TComment<cr>

" -------
" Color Scheme Plugin
" -------
Plug 'https://github.com/cocopon/iceberg.vim'

" -------
" Source Control
" -------
" Vim
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/airblade/vim-gitgutter'

" -------
" Source Control
" -------
Plug 'https://github.com/christoomey/vim-system-copy'
" press CTRL+p to paste system clipboard contents to next line.
nmap <C-p> cv

" -------
" Ranger file exploration
" > brew install ranger
" -------
" press `<leader>f` to open ranger file explorer.
Plug 'rbgrouleff/bclose.vim' | Plug 'francoiscabrol/ranger.vim'
" open ranger when opening a directory instead of netrw
let g:ranger_replace_netrw = 1

" -------
" IDE-like Vim tabline
" brew tap caskroom/fonts && brew cask install font-hack-nerd-font
" -------
Plug 'https://github.com/ryanoasis/vim-devicons' | Plug 'https://github.com/bagrat/vim-buffet'
" https://github.com/bagrat/vim-buffet#how-do-i-get-the-look-like-in-the-screenshot
let g:buffet_powerline_separators = 1
let g:buffet_use_devicons = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"
let g:buffet_autosave_always = 1
let g:buffet_autosave_untrailspaces = 0
let g:buffet_autosave_ignore = ['gitcommit']

" -------
" Airline Status Enhancments
" -------
Plug 'https://github.com/bling/vim-airline'
" enable powerline fonts
let g:airline_powerline_fonts = 1
" enable the list of buffers (https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs)
let g:airline#extensions#tabline#enabled = 1
" show just the filename (https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs)
let g:airline#extensions#tabline#fnamemod = ':t'

" -------
" Search
" -------
Plug 'https://github.com/mileszs/ack.vim'

" -------
" End Plugin Installation
" -------
call plug#end()

" -------
" Color Scheme Setting
" -------
colorscheme iceberg
