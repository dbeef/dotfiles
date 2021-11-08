#!/bin/bash -e

TEMPORARY_OUTPUT_DIR=$PWD/setup-tmux-out
PLUGINS_DIR=$TEMPORARY_OUTPUT_DIR/.tmux/plugins

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

log_stage "Writing .tmux.conf"

    cp $PWD/.tmux.conf $TEMPORARY_OUTPUT_DIR

log_stage "Downloading plugins"

    clone_github_plugin Morantron tmux-fingers
    clone_github_plugin tmux-plugins tmux-sessionist
    clone_github_plugin IngoMeyer441 tmux-easy-motion

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

