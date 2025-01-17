. ~/.config/zsh/sync/command_exists.zsh

# alias settings
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
alias diff="delta -s"
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

# rye
alias activate_rye=". ./.venv/bin/activate"

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

alias sandbox="ssh mitene-sandbox || { mitenecli login && ssh mitene-sandbox }"
