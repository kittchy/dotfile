. $HOME/.config/zsh/sync/utils.zsh

# ls系
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
if $(command_exist lsd); then
  alias ls='lsd '
  alias ll='lsd -AlF'
  alias la='lsd -a'
  alias l='clear && lsd'
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

# zsh
alias zshref='clear && source ~/.zshrc'
alias zshrc='nvim ~/.zshrc'
alias zshconfig='nvim ~/.zshrc'
alias extention='nvim ~/.zsh_extentions'
alias local_zsh='nvim ~/.local_zsh'

# cat
alias cat_detail="bat"

# diff
alias diff="delta"
# tar
alias tar_unzip='tar -zxvf'
alias tar_zip='tar -zcvf'
# tar_scp <local dir> <remote host> <保存先>
function tar_scp_func(){ tar cvf - $1 | gzip | ssh $2 "tar zxvf - -C $3" }
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
