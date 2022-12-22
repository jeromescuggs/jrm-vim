"# Basic Settings
set nocompatible				" vim-specific settings, non-vi-compatible
set backspace=indent,eol,start 	" Allow backspace in insert mode
set number                      " Line numbers
set ai
set hidden						" Allow hidden buffers
filetype plugin indent on		" Enable file type detection and do language-dependent indenting.
set history=100					" Default = 8
nnoremap ; :
set tabstop=4					" Default tabs are too big
set sw=4
set wrap						" Turn on word wrapping
set linebreak					" Only wrap at sensible places
set nolist						" list disables linebreak
set textwidth=0					" prevent Vim from automatically inserting line breaks
set wrapmargin=0
set formatoptions-=t			" Don't change wrapping on existing lines
set formatoptions+=l
set nofoldenable
set et
set cc=80
set tags=~/.vim/tags

" no indent on paste
set pastetoggle=<F2>
nnoremap <F2> :set invpaste paste?<CR>
" set pastetoggle=<F2> 
set mouse=a             " allow using mouse
set laststatus=2        "Make airline status bar appear all the time
set cmdheight=1

if has('nvim') " NEOVIM-ONLY PLUGINS
    " set packpath-=~/.config/nvim
    " set runtimepath-=~/.config/nvim
    " set runtimepath-=~/.config/nvim/after
    call plug#begin('~/.vim/plugged')
    " [ lsp config for neovim ]
    Plug 'neovim/nvim-lspconfig'
    " Plug 'williamboman/nvim-lsp-installer'
    Plug 'kabouzeid/nvim-lspinstall' , {'branch': 'main'}
    " Plug 'hoob3rt/lualine.nvim'
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    Plug 'jeromescuggs/nerd-galaxyline'
    " [ filetree for neovim]
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'
    " [ neovim themes]
    Plug 'jeromescuggs/neovim-ayu'
else          " VIM-ONLY PLUGINS
    call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'kuntau/ayu-vim'
endif         " UNIVERSAL PLUGINS BELOW

       
    " [ colorize hex codes ]
    Plug 'lilydjwg/colorizer'
 
    " [ highlighting and vim config for markdown ]
    Plug 'davidbeckingsale/writegood.vim'
    Plug 'plasticboy/vim-markdown'
    " Plug 'tpope/vim-markdown'
    " Plug 'gabrielelana/vim-markdown'

    " [ plugins for vim-as-text-editor ]
    Plug 'vim-scripts/txt.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-abolish' " Fancy abbreviation replacements
    " Plug 'junegunn/limelight.vim' " Highlights only active paragraph
    " Plug 'junegunn/goyo.vim' " Full screen writing mode
    Plug 'reedes/vim-lexical' " Better spellcheck mappings
    Plug 'vim-pandoc/vim-pandoc-syntax' 
    "Plug 'reedes/vim-litecorrect' " Better autocorrections
    Plug 'reedes/vim-wordy'
    " Plug 'reedes/vim-pencil'

    Plug 'mhinz/vim-startify'

    " [ commenting kakstyle ]
    Plug 'scrooloose/nerdcommenter'

    " [ misc goodies ]
    "Plug 'justinmk/vim-syntax-extra'
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-notes'
    " Plug 'kristijanhusak/vim-carbon-now-sh'

    " [ misc style goodies ]
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
    " Plug 'bling/vim-bufferline'
    Plug 'vim-syntastic/syntastic'
    "Plug 'edkolev/tmuxline.vim'
    Plug 'fadein/vim-FIGlet'

    " [ themes ]
    Plug 'joshdick/onedark.vim' , {'branch': 'main'}
    Plug 'srcery-colors/srcery-vim'

    " [ pizazz ]
    " Plug 'wfxr/minimap.vim'

    Plug 'yuttie/comfortable-motion.vim'
call plug#end()


" enable spell/grammar checking when writing markdown
autocmd filetype markdown,md,page WritegoodEnable

" tuning for gVim only
" if has('gui_running')
     " set number " show line numbers
     " set columns=84 lines=48 " GUI window geometry
     " set guifont=Monospace\ 12 " font for GUI window
     " set background=light " light background for GUI
" endif

" theme options
" workaround to let termguicolors play nice with tmux
if exists('$TMUX')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
else
    set termguicolors
endif

" if has ('nvim')
    " luafile /home/jerome/.config/nvim/lua/init.lua
" endif

" if the comfortable-motion plugin is loaded, set up my defaults
if has_key(plugs, 'comfortable-motion.vim')   
    noremap <silent> <PageDown> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
    noremap <silent> <PageUp> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
    let g:comfortable_motion_no_default_key_mappings = 1
    let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.
    let g:comfortable_motion_friction = 70.0
    let g:comfortable_motion_air_drag = 1.5
    nnoremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 1)<CR>
    nnoremap <silent> <ScrollWheelUp> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -1)<CR>
    nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
    nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
endif 

" ==============[ themes ]================

" set t_Co=256
set background=dark
let g:srcery_italic = 1 " custom option for srcery

" =========== [ SETTINGS: ONEDARK ] =========

hi Comment cterm=italic
" let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

" ========== [ SETTINGS: AYU ] ========
let g:airline_theme='ayu_mirage'

let g:ayu_mirage = 1
let ayucolor="mirage"

let ayu_comment_italic=1 " enable italic for comments
let ayu_string_italic=1  " enable italic for strings
let ayu_type_italic=1    " enable italic for types
let ayu_keyword_italic=1 " enable italic for keywords

colo ayu

" enable highlighting and map commands
syntax on

" file tree explorer setup
if has('nvim')
	nnoremap <C-n> :NvimTreeToggle<CR>
	nnoremap <leader>r :NvimTreeRefresh<CR>
	nnoremap <leader>n :NvimTreeFindFile<CR> 
else
	nnoremap <C-n> :NERDTreeToggle<CR>
endif

" minimap only works with recent vim version
" if v:version >= 802
    " let g:minimap_auto_start = 1
    " hi MinimapCurrentLine ctermfg=Green guifg=#50FA7B guibg=#32302f
    " let g:minimap_cursor_color = 'MinimapCurrentLine'
" endif 


" commenting
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDToggleCheckAllLines = 1
nnoremap <F3> :call NERDComment('n','Toggle')<CR>
" nnoremap <F3> :call NERDComment('x','Toggle')<CR>

" filetype associations
au BufEnter,BufRead,BufNewFile *.page,*.md,*.archive setlocal filetype=markdown
" au BufEnter,BufRead,BufNewFile *.page :setlocal filetype=md
" :autocmd VimEnter * :AirlineRefresh
