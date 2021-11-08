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

    cat $PWD/vimrc-full >> $TEMPORARY_OUTPUT_DIR/.vimrc

log_stage "Downloading plugins"

    # For python development:
    clone_github_plugin sillybun vim-repl
    clone_github_plugin nvie vim-flake8
    # For clang-format support:
    clone_github_plugin rhysd vim-clang-format
    # For CMake support:
    clone_github_plugin ilyachur cmake4vim
    # Programming IDE features:
    clone_github_plugin neoclide coc.nvim

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

