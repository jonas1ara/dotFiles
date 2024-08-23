" Set this to 1 to use ultisnips for snippet handling
let s:using_snippets = 0

" vim-plug: {{{
call plug#begin('~/.vim/plugged')

" OmniSharp for C# integration
Plug 'OmniSharp/omnisharp-vim'

" FSharp support for syntax highlighting and integration
Plug 'ionide/Ionide-vim'

" LanguageClient-neovim for LSP support
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',  " Install the LanguageClient
    \ }

" NERDTree for file exploration
Plug 'preservim/nerdtree'

" Mappings, code-actions available flag and statusline integration
Plug 'nickspoons/vim-sharpenup'

" Linting and error highlighting
Plug 'dense-analysis/ale'

" Vim FZF integration for fuzzy finding, used as OmniSharp selector
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Autocompletion support
Plug 'prabirshrestha/asyncomplete.vim'

" Gruvbox colorscheme for a pleasant visual appearance
Plug 'gruvbox-community/gruvbox'

" Lightline for a customizable statusline
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'maximbaz/lightline-ale'  " Lightline integration with ALE

" Snippet support using ultisnips (conditional)
if s:using_snippets
  Plug 'sirver/ultisnips'
endif

call plug#end()
" }}}

" Use .NET 6 for the OmniSharp server
let g:OmniSharp_server_use_net6 = 1

" Settings: {{{
filetype indent plugin on  " Enable filetype detection and indentation
if !exists('g:syntax_on') | syntax enable | endif  " Enable syntax highlighting
set encoding=utf-8  " Set file encoding to UTF-8
scriptencoding utf-8  " Set script encoding to UTF-8

" Key mappings for various functionalities
nmap <C-n> :NERDTree<CR>  " Open NERDTree with Ctrl+n
nmap <C-f> :NERDTreeToggle<CR>  " Toggle NERDTree visibility with Ctrl+f
nmap <C-s> :w<CR>  " Save the current file with Ctrl+s
nmap <C-e> :q<CR>  " Quit Vim with Ctrl+e
nmap <C-a> ggVG<CR>  " Select all text with Ctrl+a
nmap <C-c> "+y<CR>  " Copy selected text to clipboard with Ctrl+c
nmap <C-x> ggVG"+y<CR>  " Copy all text to clipboard with Ctrl+x

syntax on  " Enable syntax highlighting
set shiftwidth=4  " Set number of spaces for indentation
set expandtab  " Use spaces instead of tabs
set tabstop=4  " Number of spaces a <Tab> counts for
set cursorline  " Highlight the current line
set incsearch  " Enable incremental search
set hlsearch  " Highlight search results
set confirm  " Prompt for confirmation on unsaved changes
set number  " Show line numbers
set ff=unix  " Set file format to Unix
set paste  " Enable paste mode
set rnu  " Show relative line numbers
set textwidth=80  " Set text width for automatic line wrapping
set title  " Enable title of terminal

" Additional settings for window behavior
set hidden  " Allow switching buffers without saving
set nofixendofline  " Do not fix end of line characters
set nostartofline  " Do not start at the beginning of the line when opening a new window
set splitbelow  " Open new windows below the current window
set splitright  " Open new windows to the right of the current window

" Additional search and display settings
set hlsearch
set incsearch
set laststatus=2  " Always display the status line
set nonumber  " Do not show absolute line numbers
set noruler  " Do not show the ruler
set noshowmode  " Do not show mode in the command line
set signcolumn=yes  " Show sign column for diagnostics

" Mouse support and update time configuration
set mouse=a  " Enable mouse support
set updatetime=1000  " Time in milliseconds to wait before triggering updates
" }}}

" Colors: {{{
augroup ColorschemePreferences
  autocmd!  " Clear previous autocmds
  " Clear some gruvbox background colors for transparency
  autocmd ColorScheme * highlight Normal     ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight Todo       ctermbg=NONE guibg=NONE
  " Link ALE sign highlights to similar equivalents without background colors
  autocmd ColorScheme * highlight link ALEErrorSign   WarningMsg
  autocmd ColorScheme * highlight link ALEWarningSign ModeMsg
  autocmd ColorScheme * highlight link ALEInfoSign    Identifier
augroup END

" Use truecolor in the terminal, when supported
if has('termguicolors')
  set termguicolors
endif

" Set the background color scheme
colorscheme gruvbox
" }}}

