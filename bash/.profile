# https://unix.stackexchange.com/questions/72086/ctrl-s-hangs-the-terminal-emulator
stty -ixon

# https://unix.stackexchange.com/questions/1045/getting-256-colors-to-work-in-tmux
alias tmux="TERM=xterm-256color tmux"

# Set vim as default editor:
export VISUAL=vim
export EDITOR="$VISUAL"

# fzf aliases:
# https://bluz71.github.io/2018/11/26/fuzzy-finding-in-bash-with-fzf.html



# TODO: Paste here
alias fcd='fzf_change_directory'
alias fe='fzf_find_edit'
alias fkill='fzf_kill'
alias flog='fzf_git_log'
alias fadd='fzf_git_add'

# https://askubuntu.com/questions/161249/bashrc-not-executed-when-opening-new-terminal
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
         . "$HOME/.bashrc"
    fi
fi

