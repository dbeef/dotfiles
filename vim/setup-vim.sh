#!/bin/bash -e

TEMPORARY_OUTPUT_DIR=$PWD/setup-vim-out
PLUGINS_DIR=$TEMPORARY_OUTPUT_DIR/.vim/pack/my-setup/opt
UNDODIR=$TEMPORARY_OUTPUT_DIR/.vim/undodir

log_stage ()
{
    echo ">> $1 <<"
}

clone_github_plugin ()
{
    ADDR=https://github.com/$1/$2.git
    echo "Cloning $ADDR"
    if ! [ -d "$PLUGINS_DIR/$2" ]; then
        git clone --depth 1 $ADDR $PLUGINS_DIR/$2
    else
        echo "Already cloned"
    fi
}

log_stage "Creating temporary directories"

    echo "Output directory is: $TEMPORARY_OUTPUT_DIR"

    mkdir -p $TEMPORARY_OUTPUT_DIR
    mkdir -p $PLUGINS_DIR
    mkdir -p $UNDODIR

log_stage "Writing .vimrc"

    cp $PWD/.vimrc $TEMPORARY_OUTPUT_DIR

log_stage "Downloading plugins"

    # For syntax autocompletion:
    clone_github_plugin ycm-core YouCompleteMe
    # For tabs:
    clone_github_plugin vim-airline vim-airline
    # For searching for files:
    clone_github_plugin junegunn fzf.vim
    clone_github_plugin junegunn fzf
    clone_github_plugin kien/ctrlp.vim
    # For git:
    clone_github_plugin airblade vim-gitgutter    
    clone_github_plugin tpope vim-fugitive
    # For multiple cursors:
    clone_github_plugin mg979 vim-visual-multi
    # For auto-closing brackets:
    clone_github_plugin Townk vim-autoclose
    # For searching for contents:
    clone_github_plugin jremmen vim-ripgrep
    # For python development:
    clone_github_plugin sillybun vim-repl
    clone_github_plugin nvie vim-flake8
    # For clang-format support:
    clone_github_plugin rhysd vim-clang-format
    # Color scheme:
    clone_github_plugin NLKNguyen papercolor-theme

log_stage "Building extra deps"

# TODO: Additional steps must be taken for repos:
# fzf, YouCompleteMe, ripgrep (BurntSushi/ripgrep.git)
echo TODO

log_stage "Copy output directory to $HOME to finalize setup-up? (y/n)"

    read -n 1 REPLY
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Copying"
        cd $TEMPORARY_OUTPUT_DIR
        cp -r `ls -A` $HOME
    else
        echo "Copying aborted"
    fi

log_stage "Done"

