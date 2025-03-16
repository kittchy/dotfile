. $HOME/.config/zsh/sync/utils.zsh

# ls系
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
if $(command_exist lsd); then
  alias ls='lsd -h '
  alias ll='lsd -hAlF'
  alias la='lsd -ah'
  alias l='clear && lsd -h'
fi

# top系
if $(command_exist btop); then
  alias top='btop'
  alias htop='btop'
fi

# cd 
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

# zsh
alias zshref='clear && source ~/.zshrc'
alias zshrc='nvim ~/.zshrc'
alias zshrc_extention='nvim ~/.zsh_extentions'
alias zshrc_local='nvim ~/.local_zsh'

# cat
if $(command_exist bat); then
    alias cat="bat"
fi

# diff
if $(command_exist delta); then
    alias diff="delta"
fi

# tar

tar_zip_func() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: tar_zip <tar_file> <directory>"
        return 1
    fi

    # Calculate size beforehand
    size=$(du -sb "$2" | awk '{print $1}')

    # Use tar with error checking and progress display (if pv is available)
    if command -v pv >/dev/null 2>&1; then
        tar -zcvf - "$2" | pv -s "$size" > "$1"
    else
        tar -zcvf "$1" "$2"
    fi

    # Check tar's exit status
    if [ $? -ne 0 ]; then
        echo "tar command failed!"
        return 1
    fi
}


tar_unzip_func() {
    if [ -z "$1" ]; then
        echo "Usage: tar_unzip <tar_file>"
        return 1
    fi

    # Calculate size for pv
    size=$(du -sb "$1" | awk '{print $1}')

    # Use pv if available, otherwise fall back to standard tar
    if command -v pv >/dev/null 2>&1; then
        tar -zxvf "$1" | pv -s "$size" > /dev/null
    else
        tar -zxvf "$1"
    fi


    # Check tar's exit status
    if [ $? -ne 0 ]; then
        echo "tar command failed!"
        return 1
    fi
}

function tar_scp_func(){ 
    if [ -z $1 && -z $2 && -z $3 ]; then
        echo "Usage: tar_scp <local dir> <remote host> <保存先>"
        return 1
    fi
    tar cvf - $1 | gzip | ssh $2 "tar zxvf - -C $3" 
}
# alias tar_unzip='tar -zxvf'
# alias tar_zip='tar -zcvf'
# alias tar_scp='tar_scp_func'
alias tar_unzip='tar_unzip_func'
alias tar_zip='tar_zip_func'
alias tar_scp='tar_scp_func'

# nvim 
alias nvimrc="nvim ~/.config/nvim/init.vim"

# gpp
alias gpp='g++ -Wall -O3 -std=c++17 -I/usr/local/include']

if [[ $OS == 'mac' ]]; then
  # window manager
  function reload_macos_window () {
      skhd --restart-service
      yabai --restart-service
      brew services restart sketchybar
  }
  alias reload_window="reload_macos_window"
  
  function start_macos_window () {
      skhd --start-service
      yabai --start-service
      brew services start sketchybar
  }
  alias start_window="start_macos_window"
  
  function stop_macos_window () {
      skhd --stop-service
      yabai --stop-service
      brew services stop sketchybar
  }
  alias stop_window="stop_macos_window"
elif [[ $OS == 'ubuntu' ]]; then
  # apt
  alias apt="sudo apt-fast"
fi


## lazygit
alias lg="lazygit" 

## git
alias gc="git checkout"
alias gs="git switch"
alias gb="git branch"
alias gp="git pull"
alias gm="git merge"

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
alias zja="zellij attach"
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
