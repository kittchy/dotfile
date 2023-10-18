# alias settings
# ls系
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
alias ls='lsd '
alias ll='lsd -AlF'
alias la='lsd -a'
alias l='clear && lsd'
# cd 
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

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

# Kitaoka Lab
alias jonie="sftp kinouchi@133.15.57.7"

alias gpp='g++ -Wall -O3 -std=c++17 -I/usr/local/include']

