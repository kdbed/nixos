with import <nixpkgs> {};

vim_configurable.customize {
    name = "vim";
    vimrcConfig.customRC = ''
	filetype plugin indent on
	syntax on
	set encoding=utf-8
	set clipboard=unnamedplus


	autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
	highlight ExtraWhitespace ctermbg=cyan guibg=cyan
	autocmd InsertLeave * redraw!
	match ExtraWhitespace /\s\+$\| \+\ze\t/
	autocmd BufWritePre * :%s/\s\+$//e

	colorscheme jellybeans

	inoremap jk <ESC>
	let mapleader = " "
	noremap <F1> :mksession! .vim.session <cr>
	noremap <F2> :source .vim.session <cr>
	noremap <F3> :! rm .vim.session <cr>


	au FocusGained,BufEnter * :silent! !
	au FocusLost,WinLeave * :silent! w


	set fo+=t
	set t_Co=256
	set nocursorline
	set title
	set bs=2
	set noautoindent
	set ruler
	set shortmess=aoOTI
	set nocompatible
	set showmode
	set splitbelow
	set nomodeline
	set showcmd
	set showmatch
	set tabstop=2
	set shiftwidth=2
	set expandtab
	set cinoptions=(0,m1,:1
	set tw=80
	set formatoptions=tcqro2
	set smartindent
	set laststatus=2
	set nomodeline
	set clipboard=unnamed
	set softtabstop=2
	set showtabline=1
	set sidescroll=5
	set scrolloff=4
	set hlsearch
	set incsearch
	set ignorecase
	set smartcase
	set foldmethod=marker
	set ttyfast
	set history=10000
	set hidden
	set colorcolumn=81
	set number
	set complete=.,w,b,u,t
	set completeopt=longest,menuone,preview
	set noswapfile
	set foldlevelstart=0
	set wildmenu
	set wildmode=list:longest,full
	set nowrap
	set statusline=%{getcwd()}\/\%f%=%-14.(%l,%c%V%)\ %P
	set autoread
	set conceallevel=2
	set concealcursor=vin


	set undodir=~/.vim/tmp/undo//
	set backupdir=~/.vim/tmp/backup//
	set directory=~/.vim/tmp/swap//


	if !isdirectory(expand(&undodir))
    		call mkdir(expand(&undodir), "p")
	endif
	if !isdirectory(expand(&backupdir))
    		call mkdir(expand(&backupdir), "p")
	endif
	if !isdirectory(expand(&directory))
    		call mkdir(expand(&directory), "p")
	endif

	au WinLeave * set nocursorline
	au WinEnter * set cursorline
	set cursorline
    '';
    vimrcConfig.vam.pluginDictionaries = [
        { names = [
            # Here you can place all your vim plugins
            # They are installed managed by `vam` (a vim plugin manager)
            "idris-vim"
            "vim-colorschemes"
        ]; }
    ];
}

