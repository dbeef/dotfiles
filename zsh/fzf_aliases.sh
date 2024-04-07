# https://bluz71.github.io/2018/11/26/fuzzy-finding-in-bash-with-fzf.html

fzf_find_file_with_name() {
    local file=$(
      find -type f -or -type d ! -name '.' ! -name '..' | fzf --query="$1" --no-multi --select-1 --exit-0 \
          --preview 'bat --color=always --line-range :500 {}'
      )
    if [[ -n $file ]]; then
        if [[ -d $file ]]; then
            cd $file
        else
            $EDITOR "$file"
        fi
    fi
}

fzf_find_file_with_string() {
    local file=$(
      rg --line-number --with-filename . --field-match-separator ' ' | \
        fzf --query="$1" --no-multi --select-1 --exit-0 --preview 'bat --color=always --line-range :500 {}'
    )
    if [[ -n $file ]]; then
        as_array=(${(s: :)file})
        first_element="${as_array[1]}"
        $EDITOR "$first_element"
    fi
}

