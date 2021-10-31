" General settings 

    syntax on 
    set noerrorbells
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set smartindent
    set nu
    set nowrap
    set smartcase
    set noswapfile
    set nobackup 
    set undodir=~/.vim/undodir " Make sure it exists
    set undofile
    set incsearch
    set background=dark
    let mapleader = ","
    set number
    set loadplugins
    set hlsearch " Highlight all search findings, enter to exit highlight
    set updatetime=1000 " For git-gutter
    set background=dark
    colorscheme PaperColor
    set colorcolumn=80
    highlight ColorColumn ctermbg=0 guibg=lightgrey

" Keymappings:

    " CTRL + d - line duplication (overrides clipboard)
    inoremap <C-d> <Esc>yyp k<CR>i
    map <C-d> <Esc>yyp k<CR>
    " CTRL + k - line deletion (overrides clipboard)
    inoremap <C-k> <Esc>dd k<CR>i
    map <C-k> <Esc>dd k<CR>
    " CTRL + Shift + J - join lines
    inoremap <C-S-j> <Esc><S-j>k<CR>i
    map <C-s-j> <S-j>
    " CTRL + w - close tab
    " inoremap <C-w> <Esc> :bd! <CR>i
    " map <C-w> <Esc> :bd! <CR>
    " CTRL + c - copy
    vmap <C-c> y<Esc>i
    " CTRL + x - extract
    vmap <C-x> d<Esc>i
    " CTRL + v - paste
    map <C-v> pi
    imap <C-v> <Esc>pi
    " CTRL + z - revert (FIXME: Only in interactive mode)
    imap <C-z> <Esc>ui
    " Alt + right arrow - tab right
    nmap <M-Right> <Plug>AirlineSelectPrevTab
    " Alt + left arrow - tab left    
    nmap <M-Left> <Plug>AirlineSelectNextTab
    " CTRL + Shift + F - search files for string
    nnoremap <C-S-f> :Rg <CR>
    " CTRL + Shift + N - search for filename with given string
    nnoremap <C-S-n> :Files <CR>
    " FIXME: https://github.com/junegunn/fzf.vim/pull/628
    "        Add relative path support!
    " Jump to file in selection
    nnoremap <C-b> <C-W>gf
    vnoremap <C-b> <C-W>gf
    " https://unix.stackexchange.com/questions/72086/ctrl-s-hangs-the-terminal-emulator
    nmap <C-s> <Esc>:w<CR>
    " TODO: Make alt+d in bash to be C-w
    " nmap <C-w> dawkh<CR>
    " imap <C-w> <Esc>lcaw

" Other keymappings:

    " Undo breakpoints:
    inoremap , ,<c-g>u
    inoremap . .<c-g>u
    inoremap ! !<c-g>u
    inoremap ? ?<c-g>u

    " To disable highlighted elements for current search with enter key:
    :nnoremap <CR> :nohlsearch<CR><CR>

" Plugins:

    packadd YouCompleteMe
    packadd vim-airline
    packadd fzf.vim
    packadd fzf
    packadd vim-gitgutter
    " Disabled as it conflicts with Ctrl+n:    
    " packadd vim-visual-multi
    " Disabled as it somehow conflicts with YouCompleteMe:
    " packadd vim-autoclose
    packadd ctrlp.vim
    "packadd vim-flake8
    "packadd vim-clang-format
    packadd vim-repl
    packadd vim-fugitive

" Plugin options:

    if executable('rg')
        " allows ripgrep to detect git root / uses .gitignore for fast search
        let g:rg_derive_root='true'
    endif

    " for ctrlp to ignore irrelevant files
    let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
    let g:ctrlp_use_caching = 1

    let g:netrw_browse_split = 2
    let g:netrw_banner = 0
    let g:netrw_winsize = 25

    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#right_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#right_alt_sep = ''
     
    let g:ycm_server_keep_logfiles = 1
    let g:ycm_server_log_level = 'debug'
    let g:ycm_confirm_extra_conf = 0

    let g:rg_highlight = 1
    let g:gitgutter_realtime = 1
    let g:gitgutter_eager = 1

    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
     
    " Close the tab if NERDTree is the only window remaining in it.
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

    " https://github.com/ycm-core/YouCompleteMe/issues/2015
    set completeopt-=preview

    " autocmd BufWritePost *.py call flake8#Flake8()

    " FIXME: Irritating behavior
    "au BufEnter * :ClangFormatAutoToggle

    autocmd FileType c,c++,h,hpp ClangFormatAutoEnable
    let g:clang_format#auto_format = 1
    let g:clang_format#detect_style_file = 1
    let g:clang_format#auto_format_on_insert_leave = 1

    " tmux will send xterm-style keys when its xterm-keys option is on
    if &term =~ '^screen'
        execute "set <xUp>=\e[1;*A"
        execute "set <xDown>=\e[1;*B"
        execute "set <xRight>=\e[1;*C"
        execute "set <xLeft>=\e[1;*D"
    endif

