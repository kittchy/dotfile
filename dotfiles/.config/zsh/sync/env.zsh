# Path settingsを記述する。
. $HOME/.config/zsh/sync/utils.zsh

PATH=$PATH:~/SCTK/bin

PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
PATH="$HOME/.local/bin:$PATH"
KMP_DUPLICATE_LIB_OK=TRUE

export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yaml"

if [[ $OS == 'mac' ]]; then
    export PATH="/opt/homebrew/bin/:$PATH"

    export PATH=$PATH:~/Library/Application\ Support/pypoetry/venv/bin
    export PATH=$PATH:/opt/homebrew/bin
  
    eval "$(brew shellenv)"
    source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
    source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
    export LLVM_CONFIG=/opt/homebrew/Cellar/llvm/18.1.8/bin/llvm-config
elif [[ $OS == 'linux' ]]; then
    export LLVM_CONFIG=/usr/bin/llvm-config

fi

if $(command_exist rbenv) ; then
  eval "$(rbenv init - zsh)"
fi

# volta setting
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export PATH=$PATH:$HOME/go/bin
export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig

# rust setting
source ~/.cargo/env
PATH="$HOME/.cargo/bin:$PATH"

# CPP setting
export CPLUS_INCLUDE_PATH=/usr/include/c++/version
export CC=gcc
export CXX=g++


export PATH=$HOME/.nodebrew/current/bin:$PATH

# 環境変数
export LANG=ja_JP.UTF-8

# GPU環境であれば、cudaのパスを通す
if $(command_exist nvidia-smi) ; then
  export PATH=/usr/local/cuda/bin:$PATH
  export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
fi

eval "$(uv generate-shell-completion zsh)"

_uv_run_mod() {
    if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
        _arguments '*:filename:_files'
    else
        _uv "$@"
    fi
}
compdef _uv_run_mod uv
