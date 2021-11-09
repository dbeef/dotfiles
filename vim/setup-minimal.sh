#!/bin/bash -e

BUILD_SCRIPTS=$PWD/../build-scripts
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
        git clone --recursive --depth 1 $ADDR $PLUGINS_DIR/$2
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

    cat $PWD/vimrc-minimal >> $TEMPORARY_OUTPUT_DIR/.vimrc

log_stage "Downloading plugins"

    # For searching for files:
    clone_github_plugin junegunn fzf.vim
    clone_github_plugin junegunn fzf
    # For searching for contents:
    clone_github_plugin jremmen vim-ripgrep
    # For tabs:
    clone_github_plugin vim-airline vim-airline
    # For git:
    clone_github_plugin airblade vim-gitgutter
    clone_github_plugin tpope vim-fugitive
    # For multiple cursors:
    clone_github_plugin mg979 vim-visual-multi
    # For auto-closing brackets:
    clone_github_plugin Townk vim-autoclose
    # Color scheme:
    clone_github_plugin NLKNguyen papercolor-theme
    # Easy commenting:
    clone_github_plugin tpope vim-commentary
    # Autocompletion:
    clone_github_plugin ervandew supertab
    # File browser:
    clone_github_plugin preservim nerdtree
    # Searching for file with filename:
    clone_github_plugin kien ctrlp.vim
    # Programming IDE features:
    clone_github_plugin neoclide coc.nvim

log_stage "Building extra deps"

    cd $TEMPORARY_OUTPUT_DIR && source $BUILD_SCRIPTS/bat.sh
    cd $TEMPORARY_OUTPUT_DIR && source $BUILD_SCRIPTS/ripgrep.sh
    cd $TEMPORARY_OUTPUT_DIR && source $BUILD_SCRIPTS/fzf.sh

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

