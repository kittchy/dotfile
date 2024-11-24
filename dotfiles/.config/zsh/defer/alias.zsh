

# ## pipr
# alias pipr="pipr_fn"
# alias pipi="pipi_fn"
# alias pipo="pipo_fn"
# alias pipc="pipc_fn"

## lazygit
alias lg="lazygit" 


# ## peco 
# # history
# alias history='peco-select-history'
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

# pigz
function pigz_single_zip_func(){ pigz --best -c $1 > $2 }
function pigz_recursive_zip_func(){tar c $1 | pigz --best > $2}
function pigz_recursive_unzip_func(){tar --use-compress-prog gzcat -xvf $1}
alias pigz_single_zip='pigz_single_zip_func'
alias pigz_recursive_zip='pigz_recursive_zip_func'
alias pigz_single_unzip="pigz -d"
alias pigz_recursive_unzip='pigz_recursive_unzip_func'

# macのf** file を削除 (配下の.DS_Storeと._xxx を削除)
function removegomi () {
  find . \( -name '.DS_Store' -or -name '._*' \) -delete -print;
}
alias rmgomi="removegomi"

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

# 遊び
alias aa="asciiquarium"
alias clock="tty-clock -sc"
