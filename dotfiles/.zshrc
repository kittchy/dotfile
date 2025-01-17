# init sheldon
eval "$(sheldon source)"


export CPLUS_INCLUDE_PATH=/usr/include/c++/version
export CC=gcc
export CXX=g++

export LLVM_CONFIG=/usr/bin/llvm-config-11
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

autoload -U compinit
        compinit -i

eval "$(fzf --zsh)"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/takahiro.kinouchi/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
