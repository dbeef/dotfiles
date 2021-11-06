# Installation

Because some of the plugins require additional steps in form of building/installation
of dependencies, two scripts are provided;

* `setup-minimal.sh`
* `setup-full.sh`

For full installation, call both of them, consecutively.

# Keybindings

```
- Tab - Autocompletion (insert mode)
- Tab - Toggle pane (normal mode)
- <C-S-n> - Search for file with name
- <M-1> - File browser toggle
- <C-w> - Close tab
- <C-/> - Comment line
- <C-d> - Duplicate line
- <C-k> - Delete line
- <C-S-j> - Join lines
- <C-c> - Copy
- <C-v> - Paste
- <C-x> - Extract
- <C-z> - Undo
- <C-S-z> - Redo TODO
- <M-Right> - Next tab
- <M-Left> - Previous tab
- <M-d> - Delete word
- <M-r> - Delete to the right of the cursor
- <M-e> - Delete to the left of the cursor
- <C-w> - Select word FIXME
- <S-Tab> - Reversed tab, removes one level of indentation
- <Enter> - Will exit highlight mode after search
- <C-C> - Enter multi-cursor mode
- <Escape> - Exit multi-cursor mode
- gg - Move to the beginning of the file
- G - Move to the end of the line
- C-q - Visual block mode

Creating/deleting files:
https://sookocheff.com/post/vim/creating-a-new-file-or-directoryin-vim-using-nerdtree/
In NERDTree menu, type m and then a/d
```

# Commands

```
- :bdelete - Close tab
- :e /path/to/file - Open file
```

# Other

To ignore files when searching for string, create `.rgignore` file.

To ignore files when searching for filename, modify `g:ctrlp_custom_ignore` in vimrc.
Remember to call :CtrlPClearAllCaches and/or remove ~/.cache/ctrlp after modifying.

# General notes

````
- https://devhints.io/vimscript
- https://stackoverflow.com/questions/20936519/vimscript-can-list-creation-be-split-over-multiple-lines
- inoremap - INSERT/REPLACE mode mappings
- https://stackoverflow.com/questions/1764263/what-is-the-leader-in-a-vimrc-file
- https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
- https://www.cyberciti.biz/faq/howto-unix-linux-vi-vim-jump-to-end-of-file/
- https://vi.stackexchange.com/questions/9309/key-binding-for-enter-key-in-insert-mode
- https://vi.stackexchange.com/questions/444/how-do-i-reload-the-current-file
- https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)  
- https://linuxize.com/post/vim-undo-redo/
- https://simnalamburt.github.io/vim-mundo/
- https://mediatemple.net/community/products/dv/204644480/enabling-vi-syntax-colors-and-highlighting
- https://www.cyberciti.biz/faq/how-to-display-line-number-in-vim/
- https://vim.fandom.com/wiki/Search_and_replace
- https://medium.com/usevim/git-and-vimdiff-a762d72ced86 
- https://stackoverflow.com/questions/73319/how-to-duplicate-a-whole-line-in-vim
- https://opensource.com/article/19/2/getting-started-vim-visual-mode
- https://stackoverflow.com/questions/20576732/how-do-you-undo-setting-an-option-in-vim
- https://vi.stackexchange.com/questions/2350/how-to-map-alt-key
- https://www.youtube.com/watch?v=n9k9scbTuvQ&ab_channel=ThePrimeagen
- https://www.youtube.com/watch?v=hSHATqh8svM
- https://stackoverflow.com/questions/1506764/how-to-map-ctrla-and-ctrlshifta-differently
- https://superuser.com/questions/401926/how-to-get-shiftarrows-and-ctrlarrows-working-in-vim-in-tmux
- https://github.com/ycm-core/YouCompleteMe/issues/3794
```

# Todos

```
- codi
- https://github.com/vim-autoformat/vim-autoformat
- https://github.com/rhysd/vim-clang-format
- https://github.com/neoclide/coc.nvim
- https://github.com/Xfennec/progress
- https://github.com/vim-syntastic/syntastic
- Check alternatives for YouCompleteMe
```

