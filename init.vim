set nobackup

" no swap files by default (turn them on individually through ftplugins)
set noswapfile

" undo directory.
set undodir=$XDG_CACHE_HOME/vim/undo//,$TMPDIR//
set undofile

set suffixesadd=.js,.jsx,.ts,.tsx,.d.ts

" filetypes
autocmd BufNewFile,BufRead *.tsx set filetype=typescript

" -------
" Show Commands
" -------
set showcmd
set showmode

" -------
" Find
" -------
set ignorecase
set smartcase

" search down into subfolders
" provides tab-completion for all file-related tasks
set path+=**

" display all matching files when we tab complete
set wildmenu

" -------
" Leader
" -------
" use <Space> as leader (thanks: http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity).
" NOTE: YOU MUST map 'caps lock' to 'control' for this to be useful, otherwise it is quite painful.
let mapleader = "\<Space>"

" -------
" Depict Whitespace Visually
" http://vimcasts.org/episodes/show-invisibles/
" -------
set listchars=tab:▸\ ,eol:¬,trail:·,extends:\#,nbsp:.

" -------
" Line Number
" -------
set number
set relativenumber

" -------
" Increment/Decrement
" -------
" support + for increment (instead of only <c-a>)
map + <c-a>

" support = for increment (+ is ok but you need to hit <shift> to get to it)
map = <c-a>

" support - for decrement (instead of only <c-x>)
map - <c-x>

" support _ for increment (_ is ok but you need to hit <shift> to get to it)
map _ <c-x>

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

set tabstop=2
set shiftwidth=2
set expandtab

" -------
" Color Theme (search for "colorscheme" to find usages
" -------
" Plug 'https://github.com/jacoborus/tender.vim'
Plug 'gkeep/iceberg-dark'
Plug 'cocopon/iceberg.vim'
syntax enable

" -------
" Statusline/Tabline
" -------
Plug 'https://github.com/itchyny/lightline.vim'

" -- INSERT -- is unnecessary since the mode information is displayed in the statusline
set noshowmode

" set lighline theme inside lightline config
" let g:lightline = { 'enable': { 'tabline': 0, 'statusline': 1 }, 'colorscheme': 'tender' }

let g:lightline = {
\ 'enable' :{
\   'tabline': 0,
\   'statusline': 1
\ },
\ 'colorscheme': 'icebergDark',
\ }

" -------
" Editing
" -------
Plug 'dkarter/bullets.vim'
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch',
    \]

" -------
" Buffer & Tab Navigation & Management
" -------

" Specify the behavior when switching between buffers
" http://stackoverflow.com/a/6853779/128346
set switchbuf=useopen

" When to show tab line
set stal=2

" Maximum number of tabs to display
set tabpagemax=50

" Move to the previous buffer
nnoremap <C-h> :bprevious<CR>

" Move to the next buffer
nnoremap <C-l> :bnext<CR>

" press <leader>w to close current buffer 
nnoremap <leader>w :bp <BAR> bd #<CR>

" press <leader>q or <leader>t to navigate buffers (aka tabs) via `fzf` ^
nnoremap <leader>b :Buffers!<CR>
nnoremap <leader>t :Buffers!<CR>

" https://github.com/junegunn/fzf.vim#using-vim-plug
" https://github.com/junegunn/fzf.vim#commands
" Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/junegunn/fzf', { 'do': './install --bin' }

" relative file completion
Plug 'thezeroalpha/vim-relatively-complete'
imap <C-x><C-f> <Plug>RelativelyCompleteFile

" -------
" Easy Motion
" -------
Plug 'https://github.com/easymotion/vim-easymotion'
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Custom key mappings
map <leader>/ <Plug>(easymotion-bd-w)

" -------
" https://vi.stackexchange.com/a/2682
" Moving Lines (UP|DOWN)
" -------

" move line down
:nnoremap <C-j> :.move +1<cr>

" move line up
:nnoremap <C-k> :.move -2<cr>

" -------
" Surround
" -------
" replaces custom surround keybindings (i.e. saiw` turns foo into `foo`)
Plug 'machakann/vim-sandwich'
map <leader>[ saiw[sai[ 
map <leader>{ saiw{sai{ 
map <leader>( saiw(sai( 
map <leader>` saiw`sai` 
map <leader>* saiw*
map <leader>_ saiw_

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
" JavaScript
" -------
" styled components highlighting
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" -------
" TComment
" -------
Plug 'https://github.com/tomtom/tcomment_vim'
" press // to comment current line and/or visually selected line(s).
map // :TComment<cr>

" -------
" Software Development
" -------
Plug 'https://github.com/ryanoasis/vim-devicons'

" -------
" Source Control
" -------
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/airblade/vim-gitgutter'

" -------
" Systenm Copy
" -------
Plug 'https://github.com/christoomey/vim-system-copy'
" press CTRL+p to paste system clipboard contents to next line.
nmap <C-p> cv

" -------
" Ranger file exploration
" > brew install ranger
" todo: replace ranger with something more minimal or even fzf-like
" -------
" press `<leader>f` to open ranger file explorer.
Plug 'rbgrouleff/bclose.vim' | Plug 'francoiscabrol/ranger.vim'
" open ranger when opening a directory instead of netrw
let g:ranger_replace_netrw = 1

" -------
" Search
" -------
Plug 'https://github.com/mileszs/ack.vim'

" -------
" End Plugin Installation
" -------
call plug#end()

" -------
" Color Theme
" -------
colorscheme iceberg

" -------
" Tmux Control
" -------
" rename session with text under cursor
:nnoremap <leader>s :!tmux rename-session <cword><cr>

" rename session with visually selected text
:vnoremap <leader>s y:!tmux rename-session '<C-R>"'<cr>

" -------
" GitHub Open
" -------
:nnoremap <leader>o :!open (git open)<cr>

" -------
" File History Browser
" -------
:nnoremap <leader>h :History!<cr>
:nnoremap <leader>j :History!<cr>
