
## lazygit
alias lg="lazygit" 

# docker exec
alias de='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/bash'
# ssh 
alias sshlist="cat ~/.ssh/config |grep ^Host\  |sed -e 's/^Host\ //g'"
alias pssh="sshlist | peco | xargs -I{} sh -c 'ssh {} </dev/tty' ssh"

# latex
alias tex-clear-cache='latexmk -c'
alias tex-clear-cache-all='latexmk -C'
alias tex-auto='latexmk -pdfdvi -pvc -interaction=nonstopmode'
alias tex-count='texcount -inc -sum -1'

# fzf
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

setopt print_eight_bit

## history fuzzy find
## fzf history
function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER" --reverse)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history


## fzf cdr
function fzf-cdr() {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | fzf --reverse)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N fzf-cdr
setopt noflowcontrol
bindkey '^q' fzf-cdr

## zellij
alias zj="zellij"
alias tmux="echo tmuxよりzellijを使うようにしましょう。zjにエイリアスをはってます。"

# PDF圧縮
function pdfmin()
{
    local cnt=0
    for i in $@; do
        gs -sDEVICE=pdfwrite \
           -dCompatibilityLevel=1.4 \
           -dPDFSETTINGS=/ebook \
           -dNOPAUSE -dQUIET -dBATCH \
           -sOutputFile=${i%%.*}.min.pdf ${i} &
        (( (cnt += 1) % 4 == 0 )) && wait
    done
    wait && return 0
}


# 遊び
alias aa="asciiquarium"
alias clock="tty-clock -sc"
